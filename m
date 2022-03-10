Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 19EB74D416D
	for <lists+linux-media@lfdr.de>; Thu, 10 Mar 2022 07:57:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239955AbiCJG6Q (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 10 Mar 2022 01:58:16 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50414 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239945AbiCJG6P (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 10 Mar 2022 01:58:15 -0500
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 764E412F409
        for <linux-media@vger.kernel.org>; Wed,  9 Mar 2022 22:57:15 -0800 (PST)
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
        by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 22A1IsHK023142;
        Thu, 10 Mar 2022 06:57:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : content-type : mime-version; s=corp-2021-07-09;
 bh=3cr0DObnIWmhiTFVuqud8DcSrcqr9Rj9IJJqeRfVzDA=;
 b=gCF+PUkreo5dERPfx7p4FK/ctcu9xYs4uUD8FtiYafVoA0DqkqX6Jc7ze9tFThuLzjHg
 zL3HnFuiqs6l+R0icNNjSygsDd3Cvq9kNAU/fioC3P4iXwuUsXXoIm9sRTuiTchnZjKM
 x1pPEd7UKoMSOeDAVCGfltjUe07UxhFMiq4EN4wXm384RjgPYlIG+xvO5UHa2oqV2dHv
 f3ThuJOZ8H1m0rT55KnAGehA0UJO/8VvANjIJfbXwnU8R/Z8PF8JD9BEqH/GOt5WguAM
 IzYaPBCaJD/SgQqXd0ZqNaXqDLc2cPnqXQv8PFSxS8zZittVbKA7PIVQsfGX9QIQDb3c 1Q== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
        by mx0b-00069f02.pphosted.com with ESMTP id 3em0du4cya-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Thu, 10 Mar 2022 06:57:12 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
        by userp3020.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 22A6uPk7033855;
        Thu, 10 Mar 2022 06:57:10 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2048.outbound.protection.outlook.com [104.47.66.48])
        by userp3020.oracle.com with ESMTP id 3envvn28tt-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Thu, 10 Mar 2022 06:57:10 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=krnjFjQAWlzOe0z+LQHmSySKqQ4vUDm6cutG6lwDEZ+9K8Y+507LpkqJyuWQgWONhiWhv+oaNmHrLYaLupzByRc+HeVVkCIHwpQOBFYYCdRAA/O+OmETzZEr/dTSO/aoCu0TE4twsGjIuLvvsNIS6X0DY7Xjrgs6XOYxtMcVhacgkqcSGOZf/Dmx6bcU8dTVcMtDa4tj3yA7/x5Xq4sNVRQjiicf7CUxSS0IL9RBsTFlHzFiPyzFIqwKIR8x312Qel65XQlhSa7/wRusg2oeeiwoMsMVTXgYTTRofB2vEcINuAuSiZTb91A7FgJmJE/7b8mmj56vMliOfRMd+IQGtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3cr0DObnIWmhiTFVuqud8DcSrcqr9Rj9IJJqeRfVzDA=;
 b=LtUbEo+wCkUOH1dzLqvm5/w8PYN5lr6R6xDmGf+DG8cE0ae/W37giYAyvhriDfLSYKjbtO3prJzCzq911pj02qSGeG3j12axtK8K5auMR41MKsDhO68QZk7VH8wrcvsUmJnCpUKbKP5CyVm+JHjIaEyaDCZEVcCG60Grw/3tTGwFbB4bfos5ajDTFGMTiiiYp7ouibOYNekr3Ruh8nG5CE29f/mvD+21TeTv3/h+FvbL3sAIeM50mFIWLQCoPy8Nt9PcUjabevK+MwbdzWpBjK8JMQYHcULRfU0fbFAQFfSW816xvKx3TWGhPhXiJZHb9jNQBAB0xjPx1sHhDlTXjA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3cr0DObnIWmhiTFVuqud8DcSrcqr9Rj9IJJqeRfVzDA=;
 b=tj2f5ey5ZmdGz0szZhdG+XwK1TXLMGgPKEpo+AEGMMRn8vFWsXR0P9HEiFkjUugFSuWC6+LGbvW5s2//w/fNzElcoTBgYGpxlaonzGzDsmx9Zb2aBj48uAXnswVyNpA+83SMbZsTNuhLj1XxIzs4c3fqZIAWsYGgC4opfF95t3o=
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by CH0PR10MB5243.namprd10.prod.outlook.com
 (2603:10b6:610:dc::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5038.16; Thu, 10 Mar
 2022 06:57:06 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::2c3d:92b5:42b3:c1c5]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::2c3d:92b5:42b3:c1c5%4]) with mapi id 15.20.5061.022; Thu, 10 Mar 2022
 06:57:06 +0000
Date:   Thu, 10 Mar 2022 09:56:54 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     ming.qian@nxp.com
Cc:     linux-media@vger.kernel.org
Subject: [bug report] media: amphion: implement windsor encoder rpc interface
Message-ID: <20220310065654.GA3476@kili>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
X-ClientProxiedBy: ZR0P278CA0076.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:22::9) To MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0a9e8768-1f17-4435-7c1b-08da02633028
X-MS-TrafficTypeDiagnostic: CH0PR10MB5243:EE_
X-Microsoft-Antispam-PRVS: <CH0PR10MB5243DB7820A31D8B5A4E41208E0B9@CH0PR10MB5243.namprd10.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: OXNjv4xZCxjV3IgcERDE++QA+6X87kh1WeIbevQ2jt6iMxsXoTObZz6H/Gp87tR0Xhj8Sutu8q2d33dht+8nOtFtPZh1SufaDfrWkEDmPTa2yGD/5J1PXauQruc+NN1YZfl8a01SHffD1X2O57J7P4IZd3y+L6R1j2bGj94pScL6TaRFLXqtAnse/s3r4dv50CBgEloCFyS5pHMaTqTNNA9RJ8Mf+at6nPT30v2Jhid9qTL1E1a+sP7oLc9qKEKmLos5uy2DEFq+IW0IMtBHX0AL+juIF8G159/nrsVMri14N4FfND48E0Nf+4X2VYVtHnDXyyBXPlKUob0gFDou43P3xkNhh2ZVtblo4Oni0EvWNyPxHHXBlGIMnrjQWcKvs3rdPmdunYhqw0pIfSbMczzQQOa/KQbDMKoUEyqI8RO2PZIaybowAEy20J2/NlSxxrorUMZ4oyQhPopaTnTgp232fiFbv7G8NYivMwKxUzYW5POKN+o4FnNSB0rP+/1CuUmuOlcqh8MmVcsTyfXPhinfUmcqq/4epPEsJuZVzYjcC03gavRhW0y/ejaTY1DBxikpE3Rf4i4cbkXHrog0y2s4XqtwjJ8YNhy9XMFWl+r7eqHBK3OCGNTMno5PgO3DbBoTujhx2XXs3dus8JuuO6wJxa/p080ONbkUENdTm8Ak8XWgFwSsUw5knmdOxy9I
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MWHPR1001MB2365.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(7916004)(366004)(9686003)(6512007)(86362001)(508600001)(26005)(6666004)(6486002)(1076003)(33656002)(186003)(52116002)(5660300002)(38350700002)(83380400001)(6506007)(38100700002)(8936002)(66946007)(8676002)(4326008)(66556008)(66476007)(33716001)(2906002)(44832011)(6916009)(316002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?chtkyw57FPAnSLND5ihxLpOVjLwH4DKfJk9q04z1fadGokX+wk9+Ox8POwFW?=
 =?us-ascii?Q?/JGxiHYQm9wWuaWXxEZq7JPbU3FAQSy+AI+jzRdF9VjHqv4OSWI4iqLsZKP4?=
 =?us-ascii?Q?NKDnnj+M5nGWSWFnq5sZOkGsD5b889G4yDWEFVdpjWZAnnCnMKMZV9XNkUtS?=
 =?us-ascii?Q?+znFvD1oLlFWBewU+V58y49tL6t1eORHSSbrCgoGUiTGwpoTrBz6CnQw4J9g?=
 =?us-ascii?Q?NRr7WSEe0vArAZTbPMO/60XcWSVPtaIHvQATqzACWaRRvnEM65mmIxWZ+S+W?=
 =?us-ascii?Q?vTqn1c6hQJhsSdn3d+XoLjUIXfwd8d+Dq4vejf60+Ph8/GKetYs6tOLiyULD?=
 =?us-ascii?Q?dwI70PsEF37aEZzxQI6D+HOGtgPCraZCFgpRhPWxHFQriE1aHZAYs82nrHY9?=
 =?us-ascii?Q?sjaEfCRaH0AWK/hVILE7R9zYeBT2/OKkI6obozL3tLrChK0zi3gKN3XMTqdC?=
 =?us-ascii?Q?wWm77TUNfPWpLxLUbLRMbnCzNPee/4fiM6RBFq4wtyfhxaVWflz8pXflxsea?=
 =?us-ascii?Q?kNY9wrsjXuzQE0DJJ8gsP0G1Euy7BKKAFs8joCfOCiLyA4gu+pKF9OWYC8/S?=
 =?us-ascii?Q?ZRoingg5N8N1/uLaO8t5TO5p7kRq35oCRRM4G9ZGofVPoHXOWmvbSEfgrWtr?=
 =?us-ascii?Q?ZrSeYhtqUacc7ixbGHyJlN8Ots6dIwjsUgE+780aucpdafQjINrOypNTXOqe?=
 =?us-ascii?Q?ah/wfTkws93YflKyHdGWgQmRS2D25i1YHASfOMux5WS5xwdkzseig51TZCJZ?=
 =?us-ascii?Q?vRj5+GA/s/yjHu0C/ZDtWE9b5zyFtKjtStuo/UqSUsyCrvEodffcfmQN99zF?=
 =?us-ascii?Q?6qcJWkHxET9AQfRr/NJSUKtoG53IcrDYjcjJJJEDCrfwxsMM955Njl8YErS0?=
 =?us-ascii?Q?jqKkHvBPXcuSEyVAkqOM21ojQ4FN1GCg6T9rQl8JepfwL/im6Tl5qaxZ+8N6?=
 =?us-ascii?Q?nUfGX0Y2ENsM4cKBuDZYUId9WnBZ45SF4uY5BCOm5H7VjuLDwj23cp7v9Qez?=
 =?us-ascii?Q?e5IO3OhQPmPOVNgUJG5oMdudZo8OnyTAidzkP6eUDZ8h08q5cDy4tIBbbHNa?=
 =?us-ascii?Q?sEeg7VAwnO38JhYiLbx0LyurbdVBGjmPrPsW7X0f837IRDNLrbN9RaQ46vIw?=
 =?us-ascii?Q?8bbyeV7XGAZMJlvFdrEftY4c1ZBVGnJ0QDA3zJAUTPAU/Ik8jJvg5F9RW4ol?=
 =?us-ascii?Q?vJU56eaAOybFraVfWPO4XRU53HN+Qh/1CvH1QW9GQuA8+O60fNyq/z1CtuIP?=
 =?us-ascii?Q?ZXtgjhvssVg/Ol6vJk3kZoIsvPfj7GcaTq+BdLf1rxKR93OIGwlG4Kn7E90b?=
 =?us-ascii?Q?RexCOvGl0eP7dvrcwyWZ7Wd69gcdpVrcUSrPY8LtVaJJDNbHBZTP2/Qp5f/O?=
 =?us-ascii?Q?xw63GNGDgpV0CrOzjJTvn5PMNjjY0XFrvtyFfkedNNH3dcIT1/NITCm0KB65?=
 =?us-ascii?Q?ZJm8+tFBpRtqI75jTrhCH/nJ/js7vBATjZYjDQgyqhtCxbo3yuY1fYKHRFiJ?=
 =?us-ascii?Q?omGcWzPD7QVslCf6AvPxgVmVsaFA1RVHkOTuTusWq9SwY65WFv0lzkscer3P?=
 =?us-ascii?Q?quzjRQotxWDIk6Pf+s6BdvgMK26qDm06eTczzrhGR8thu5U5m2Q9gvx+3qNa?=
 =?us-ascii?Q?R+tZght7Zu+nBVel/CsgcrJgntfseNaTUT4GktwqyTym+rosm+0AXUnFs758?=
 =?us-ascii?Q?IGV08w=3D=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0a9e8768-1f17-4435-7c1b-08da02633028
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Mar 2022 06:57:06.1198
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Mk6sNXtsOMd8YWCGJY1TsCWKd3EiPkNRfyalpcdtrOEKvbP5ZXkPAayZCEv5fulnR8MTLPO5OrgUVYMtd18trEQ/EBBFP5gXEZrKalG8lr8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR10MB5243
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10281 signatures=692062
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 mlxlogscore=999 bulkscore=0
 phishscore=0 malwarescore=0 suspectscore=0 mlxscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2202240000
 definitions=main-2203100034
X-Proofpoint-ORIG-GUID: WzxeGizQUcuJCYIjd7Kmnx2syXpJOoGy
X-Proofpoint-GUID: WzxeGizQUcuJCYIjd7Kmnx2syXpJOoGy
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello Ming Qian,

The patch d82977796c48: "media: amphion: implement windsor encoder
rpc interface" from Feb 24, 2022, leads to the following Smatch
static checker warning:

	drivers/media/platform/amphion/vpu_windsor.c:823 vpu_windsor_config_memory_resource()
	error: buffer overflow 'pool->enc_frames' 6 <= 7

drivers/media/platform/amphion/vpu_windsor.c
    807 int vpu_windsor_config_memory_resource(struct vpu_shared_addr *shared,
    808                                        u32 instance,
    809                                        u32 type,
    810                                        u32 index,
    811                                        struct vpu_buffer *buf)
    812 {
    813         struct vpu_enc_mem_pool *pool;
    814         struct vpu_enc_memory_resource *res;
    815 
    816         if (instance >= VID_API_NUM_STREAMS)
                                ^^^^^^^^^^^^^^^^^^^
This is 8.

    817                 return -EINVAL;
    818 
    819         pool = get_mem_pool(shared, instance);
    820 
    821         switch (type) {
    822         case MEM_RES_ENC:
--> 823                 res = &pool->enc_frames[index];

This only has WINDSOR_MAX_SRC_FRAMES elements.

    824                 break;
    825         case MEM_RES_REF:
    826                 res = &pool->ref_frames[index];
    827                 break;
    828         case MEM_RES_ACT:
    829                 res = &pool->act_frame;
    830                 break;
    831         default:
    832                 return -EINVAL;
    833         }
    834 
    835         res->phys = buf->phys;
    836         res->virt = buf->phys - shared->boot_addr;
    837         res->size = buf->length;
    838 
    839         return 0;
    840 }

regards,
dan carpenter
