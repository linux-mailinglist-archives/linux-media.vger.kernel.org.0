Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 624755A933E
	for <lists+linux-media@lfdr.de>; Thu,  1 Sep 2022 11:34:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233867AbiIAJeW (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 1 Sep 2022 05:34:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43074 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234071AbiIAJeJ (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 1 Sep 2022 05:34:09 -0400
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2FE171321FE
        for <linux-media@vger.kernel.org>; Thu,  1 Sep 2022 02:34:01 -0700 (PDT)
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
        by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 2819GGEj017281;
        Thu, 1 Sep 2022 09:33:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : content-type : mime-version; s=corp-2022-7-12;
 bh=pgo2luCv9OCHmd/a6cF+LoZrRCjiUeJT/yOdAlYheNY=;
 b=rnNTWa0fns+LWxbfnNHpr6AlYuRFuzRTWLF4/GizfagjqgRLcYxxj7O+5p1mmBoTjTUM
 dZ0DMAFe2oAwsIVvBsAxqC7+KSNwPlFjjZ4XroU4xjJ7mwOlo5/smXlcqk0ZBlC0fznS
 Dc3bBsqKlYPmzRg1hmrdG0uP/HXv6mN4/NQ7huAzGydPLUdVx+kNzspLNVGU4mH1V7T6
 30dA83GmQbEWKsIQmIi58v2mR5EtcUyGAHi2jV6A87UdwO4g2nwo0x/Bm8dghYILTHhj
 kGjtZPvVbwjPy+hUfYL/nQwCxcpFPd1tv5s+fnjJCLkfsd83wiDAPfdL/3xza4lZu68O Og== 
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
        by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3j79v0unhs-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Thu, 01 Sep 2022 09:33:48 +0000
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
        by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.5/8.17.1.5) with ESMTP id 2817nK4w036322;
        Thu, 1 Sep 2022 09:33:47 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10lp2100.outbound.protection.outlook.com [104.47.55.100])
        by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 3jarpau89s-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Thu, 01 Sep 2022 09:33:47 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Lwuo5Dvm1ih0yJzgq4RxW5my9GmoMxs/vM5AYHUR5qL1BbV60ywt7d5gRC+fQHqQIMptXBpevKeJbpnt8Yd7uqNVHLez9+b0AhAjV+LBLtD761blBwQcCyn5ERbSudwN+t2Bp3KH92KjU3mMW1bvHOYPEbHG2IOpPuEq/q3jHnpxgu64165NhYLOSwT3zB4lKefGA32rCdIExqZEIh/G1orXdxYFkTZXrViNKlvGuzRfs3NU1+P+9qV5IPIuji7Afn4nTcv3X+qi6hfZSd7h1mTUJVJgDrv0puKHH5BLMJcSLIfagcuAwKm6KsNZzVIXZBLY4Mhe8/IMAstuM9awiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pgo2luCv9OCHmd/a6cF+LoZrRCjiUeJT/yOdAlYheNY=;
 b=i8TNuQRyGHFk/u1gx8PRvUsTBonaeOHkXn0i/j08IxEzh/V5kyFePXYmMp8sseUSex2xr/pQaEy3E5LNne58r53l/VqNsqnAyrrQjmyXQ54J1t4MoUTz1Zohwyf/yju2NdK3y8T95MLQETzdAP4B1nuUqm+QPhECOT2btqhqKDWwP6sixsbPNgYP5oWAA/6ysZlvJTLjZvrCLzrqoZ/yZ86d6JKSIcUoIH+cPSckRV8kqdzOnQSanZo2P/Fv27bBeCzxSzm+rJnXoC+g99hRzBUpugGx3WSu0ogSuQwaDF8doG6S6y1btFGc94K7VHdDYfJQP3qsKmLQcuk5GR39hg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pgo2luCv9OCHmd/a6cF+LoZrRCjiUeJT/yOdAlYheNY=;
 b=feXxXfNTH4f9E3CT84UiVyJj0EsMR9JMQcZfWidUHnj4EMemKFFoOPPsX9UbQNbpPBFlRMRgt4bZ0Qm8DBCa0sc16fcNJZS9SWfKhB8FePmB/MUX48tqgb6hxQhtZB43tNHkOU1YXLrVIqsHfPvJqmj7YndafgnMDY+yHdAohvE=
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by SJ0PR10MB5663.namprd10.prod.outlook.com
 (2603:10b6:a03:3db::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.10; Thu, 1 Sep
 2022 09:33:45 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::209e:de4d:68ea:c026]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::209e:de4d:68ea:c026%3]) with mapi id 15.20.5566.021; Thu, 1 Sep 2022
 09:33:44 +0000
Date:   Thu, 1 Sep 2022 12:33:35 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     moudy.ho@mediatek.com
Cc:     linux-media@vger.kernel.org, linux-mediatek@lists.infradead.org
Subject: [bug report] media: platform: mtk-mdp3: add MediaTek MDP3 driver
Message-ID: <YxB8b8lkU62yJzDM@kili>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-ClientProxiedBy: ZR0P278CA0124.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:20::21) To MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d37fa142-4d23-4eac-b58b-08da8bfd107f
X-MS-TrafficTypeDiagnostic: SJ0PR10MB5663:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: gfleCzoVvIOEvjt6uTbAyCKV8IluPFUo9k2J08zAttOBnfHA+kKGKsqaoLNMen2gRRxzD1QP8jpz0v26BalUIvvPNkVW2Z7rONlz/CXc+j+PPwb0Uu1KNLCli4FsJfYyIOIycwC7PJxpgyQN1/1qPuj7tpboS5NZjYzpwLvGyEFyJt5NvQMpEMqPq4r1db6NhyTdYnNX8j3RXOozAv3Skxy9h3qLhFzzjJwFl/aRikvukZ+fBmlfg90iNatM8vfU4vnmkXQXLr5eMcNH+IVTd2ob1TK/Fq6tpmOvkJxCvDujncYWsint9XZHS9OWjbzcJMIMIyh5cv5L7ve+sdc4rMMoAFFGC65qI6MC7qy3fI24qz6XbZwuXAw/TGZ7YtN4WE2l8WiRGBTw+qC4y3eRTk2xDFH/un3zJSXtDtPpfXe5hsGt1ejXO6GpSvi8woYmpVIzQIAocsqXW7khe02VIav4l2gjMiuACnydlQnVW5QeVOnt0qr+/f6iCXycVPgz17sQSDp6HUffkCXkVROKuUajQBfcSXadZHhHsJrGaSW3fCJhDkUdWJ7o0PZV7ee+QElg8q5geZAAOCfNApCD2k5ceY3WFZ+d6e2wgqTK//Ky99Az4JcGWMO+3Szp9fuDNzA+6rBy4IM6cNq+D1DzxMF+AZkLjGjOdC/SSHj3nkwG9UeFdh3ajo1dW3QNUqyHjFAI/wkLfPA3PivOagfHBTlVRWOi6JHlgyQL//OBlPFQpY7vhpvGBfF21EL7UHk+sTV5UzRbpN/UmZAe7ZPyQg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MWHPR1001MB2365.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(7916004)(366004)(396003)(136003)(39860400002)(376002)(346002)(6506007)(9686003)(86362001)(66476007)(38350700002)(38100700002)(52116002)(316002)(6916009)(66556008)(6512007)(6666004)(66946007)(33716001)(8676002)(26005)(6486002)(478600001)(41300700001)(8936002)(4326008)(83380400001)(44832011)(5660300002)(186003)(2906002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?QZ+jxKkbuxYZXL1HCfzDWN1/hiGgswk2JM9MilyUxYYNQ2BZU/8i/4mbLmKF?=
 =?us-ascii?Q?1eiMr002Rn860GSOwnEelNTdrWUPEIeLFdGsDwVk0BDcCM6UX6Uq/gIMskAe?=
 =?us-ascii?Q?yIb/Eu/wCqDWM1jOuXl+Oj19wrdowgLgajCKrbChJgO77Wv8EkRK5zlMOnPB?=
 =?us-ascii?Q?suhEs3mZ31HgiGfsyQaEqY1opOvBBJCzeuDRpexsqECEsTsBbjTUyfEQHWs6?=
 =?us-ascii?Q?flgp9ySRsGH3bUy3B9ZCGXc7TXBJIKG06fnJCcNxb6ahVouHnN/9wVLOscqi?=
 =?us-ascii?Q?21TICflscYHR/h0o0wzkslbZpweZbVuDXtRN0xIpKJsni1KKpvfeJsRU7U3U?=
 =?us-ascii?Q?m/jJYpxsnN6Xpxw2kEKGq3UpbCVzZNgIyCf7KTot1Dunm95tt3Yu9ZdgP1e/?=
 =?us-ascii?Q?VWmf1QSebHh6QSiHSaYtns58BQ25ebgqLeEOJff+h4tMgMM0sudRuxK68b0I?=
 =?us-ascii?Q?wUWTFcD9JSuISHAzk5WxKTqepnxWhXbygvKAejPXSOLIhZtiNpB3tV7E0OVV?=
 =?us-ascii?Q?HRZHU0Itz3IgBP29WKu+w8IdYKNcHwvHxA13cv9DUWRWHmRejn1n5h75Zt2g?=
 =?us-ascii?Q?TW8RsRdlSVHtHXhbbC50mjqWVpHN6qBjVlQcO9dk60n6nc4OpJxEpyL305LD?=
 =?us-ascii?Q?smkTPEKuB3SWgGy0PBQgipd57ufaGepIhGQG7zzcoRnv3zjYXVJ6cXYIyoK0?=
 =?us-ascii?Q?Ua2vE27+T5Egmj8zXzB0VWxvRscRYClG4M69zaQh9AxYYCh8gqVg6mdxBaSM?=
 =?us-ascii?Q?inLFgrxVnvGn/eprKtDNRW1bbR3GUXDuvYsIgkAjuLeEvwOmYAyCUaS+Pwag?=
 =?us-ascii?Q?hlPencjA2bn8+aLI2R5JHSlIBidp0PcfoivholJ69zCuONLq+qn9UY+VwBw/?=
 =?us-ascii?Q?N9rCbwRxVHvbs0KleveQm7LwDlSwTRqr7Ncgs6eLM9YDefLcAbSAn/tFFpX9?=
 =?us-ascii?Q?MfN/BHX8Jo0702FC+HQeB8raq5mgKHX8wmqVMipJXMDDgKyYTPH8O17RZZMl?=
 =?us-ascii?Q?SoBDHORc/2PzYc0UMZemN6rVNkfY5dNOu8OnQlBLsBRtNDhI4fUBaXlxtYmW?=
 =?us-ascii?Q?OrQF/cowpOfEyK0pe8KNJyE7/DNhaD6iOFc/ywHstKGCZA7FEz1dtkUU4hjI?=
 =?us-ascii?Q?xmApPCbC5Lf/KRS74GRBDyPj0dHc8zomsv0qMkj8HaK4iTcxF3WpL9Tw5Xi9?=
 =?us-ascii?Q?yAPcKYCeJiAu2DPLS7rMYaEhw3UXX1TEiQf9ZvFc0l+zc4uXBBNSU4oC/eEz?=
 =?us-ascii?Q?XeoRE3MO4nYFiwtnBQSl+NrLe8wE8rw9G2p4qdN8jAJy1YKQkoQK0SlduB7f?=
 =?us-ascii?Q?B0u8rWbdCk8t0w5X1blCC94dIKLT0hhO44XQrUALDd1WybKe4Ul87LDNblNi?=
 =?us-ascii?Q?jAPEe22akdGV6OUDEegV18oKSvrLyJw706HJr7SDRGkOjKGNAbXWTHr0V7w7?=
 =?us-ascii?Q?Gt6OSfgZG/r0IBvJxFjIKLwxbRSr8EPNDH8ftyzr9/mWCoO1R8KN8HgsNXqS?=
 =?us-ascii?Q?1xaJXPBAaz1K+AzReRC2eSuqQF3oNqtE4yLaHVp4CSJnQ53stJEwy5FiKUxx?=
 =?us-ascii?Q?cKvBdJQzXJmzdzxLqGV1j/wyOR5nN5QRqdLoSiEeH6HdP8p6VX1fJxPBKH8y?=
 =?us-ascii?Q?aA=3D=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d37fa142-4d23-4eac-b58b-08da8bfd107f
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Sep 2022 09:33:44.7856
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WVYetJtFEx3+Fwa9CEI0HD5Is2utO+H5A79Jeojf8JasuqsUI3YvcmbCgkqHNmhc9TzPwlhRwe28SP5Un2KJ8eqF8PbuKRZNVIOJYA4QCSo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB5663
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-09-01_06,2022-08-31_03,2022-06-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 mlxscore=0 phishscore=0
 spamscore=0 adultscore=0 suspectscore=0 mlxlogscore=999 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2207270000
 definitions=main-2209010043
X-Proofpoint-GUID: ROgYTcl-A3ULnvm97Whx_sqqxeviCxFQ
X-Proofpoint-ORIG-GUID: ROgYTcl-A3ULnvm97Whx_sqqxeviCxFQ
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello Moudy Ho,

The patch 61890ccaefaf: "media: platform: mtk-mdp3: add MediaTek MDP3
driver" from Aug 23, 2022, leads to the following Smatch static
checker warning:

	drivers/media/platform/mediatek/mdp3/mtk-mdp3-core.c:292 mdp_probe()
	error: we previously assumed 'mdp' could be null (see line 188)

My blog entry gives a good overview of how to write Free the Last Thing
Style error handling.  Let's take a look at it as it applies to
mdp_probe().

drivers/media/platform/mediatek/mdp3/mtk-mdp3-core.c
    180 static int mdp_probe(struct platform_device *pdev)
    181 {
    182         struct device *dev = &pdev->dev;
    183         struct mdp_dev *mdp;
    184         struct platform_device *mm_pdev;
    185         int ret, i;
    186 
    187         mdp = kzalloc(sizeof(*mdp), GFP_KERNEL);
    188         if (!mdp) {
    189                 ret = -ENOMEM;
    190                 goto err_return;

There is no Last Thing to free.  This should be "return -ENOMEM;".
This goto will crash.  The Last thing is now "mdp".

    191         }
    192 
    193         mdp->pdev = pdev;
    194         mdp->mdp_data = of_device_get_match_data(&pdev->dev);
    195 
    196         mm_pdev = __get_pdev_by_id(pdev, MDP_INFRA_MMSYS);
    197         if (!mm_pdev) {
    198                 ret = -ENODEV;
    199                 goto err_return;

This should be "goto err_free_mdp;".  This goto will trigger a series
of WARN_ON() stack traces.  The Last Thing is now mdp->mdp_mmsys.

    200         }
    201         mdp->mdp_mmsys = &mm_pdev->dev;
    202 
    203         mm_pdev = __get_pdev_by_id(pdev, MDP_INFRA_MUTEX);
    204         if (WARN_ON(!mm_pdev)) {
    205                 ret = -ENODEV;
    206                 goto err_return;

This goto should call put on mdp->mdp_mmsys dev_something.  It instead
leaks that.  But it does call mtk_mutex_put() and each call will leads
to a series of stack traces.  The Last Thing is now mm_pdev.  That
doesn't seem to be stored anywhere so it's going to be complicated to
free it...  :/

    207         }
    208         for (i = 0; i < MDP_PIPE_MAX; i++) {
    209                 mdp->mdp_mutex[i] = mtk_mutex_get(&mm_pdev->dev);
    210                 if (!mdp->mdp_mutex[i]) {
    211                         ret = -ENODEV;
    212                         goto err_return;

If this fails it should unwind the successful allocations:

	while (--i >= 0) {

But instead it does unwinds everything.  Stack traces.

    213                 }
    214         }
    215 
    216         ret = mdp_comp_config(mdp);
    217         if (ret) {
    218                 dev_err(dev, "Failed to config mdp components\n");
    219                 goto err_return;

Alright.  Good.  This will leak the "mm_pdev" references but it will not
print any stack traces.  The mdp_comp_config() function uses One Magic
Free Function style error handling so it is buggy.  The Last thing is
now comp_config.

    220         }
    221 
    222         mdp->job_wq = alloc_workqueue(MDP_MODULE_NAME, WQ_FREEZABLE, 0);
    223         if (!mdp->job_wq) {
    224                 dev_err(dev, "Unable to create job workqueue\n");
    225                 ret = -ENOMEM;
    226                 goto err_deinit_comp;

Hooray!  This label has a good name and frees the Last Thing.  The new
last thing is the ->job_wq.

    227         }
    228 
    229         mdp->clock_wq = alloc_workqueue(MDP_MODULE_NAME "-clock", WQ_FREEZABLE,
    230                                         0);
    231         if (!mdp->clock_wq) {
    232                 dev_err(dev, "Unable to create clock workqueue\n");
    233                 ret = -ENOMEM;
    234                 goto err_destroy_job_wq;

Hooray!

    235         }
    236 
    237         mm_pdev = __get_pdev_by_id(pdev, MDP_INFRA_SCP);
    238         if (WARN_ON(!mm_pdev)) {
    239                 dev_err(&pdev->dev, "Could not get scp device\n");
    240                 ret = -ENODEV;
    241                 goto err_destroy_clock_wq;

Hooray!

    242         }
    243         mdp->scp = platform_get_drvdata(mm_pdev);
    244         mdp->rproc_handle = scp_get_rproc(mdp->scp);
    245         dev_dbg(&pdev->dev, "MDP rproc_handle: %pK", mdp->rproc_handle);
    246 
    247         mutex_init(&mdp->vpu_lock);
    248         mutex_init(&mdp->m2m_lock);
    249 
    250         mdp->cmdq_clt = cmdq_mbox_create(dev, 0);
    251         if (IS_ERR(mdp->cmdq_clt)) {
    252                 ret = PTR_ERR(mdp->cmdq_clt);
    253                 goto err_put_scp;

Ugh...  The mm_pdev name changed to scp.  It took a while to figure that
out.  This unwinds the __get_pdev_by_id().  Fair enough.  The Last thing
is now cmdq_clt.

    254         }
    255 
    256         init_waitqueue_head(&mdp->callback_wq);
    257         ida_init(&mdp->mdp_ida);
    258         platform_set_drvdata(pdev, mdp);
    259 
    260         vb2_dma_contig_set_max_seg_size(&pdev->dev, DMA_BIT_MASK(32));
    261 
    262         ret = v4l2_device_register(dev, &mdp->v4l2_dev);
    263         if (ret) {
    264                 dev_err(dev, "Failed to register v4l2 device\n");
    265                 ret = -EINVAL;
    266                 goto err_mbox_destroy;

The cmdq_clt is an mbox.  Fair enough.  Good name, label does what we
expected.

    267         }
    268 
    269         ret = mdp_m2m_device_register(mdp);
    270         if (ret) {
    271                 v4l2_err(&mdp->v4l2_dev, "Failed to register m2m device\n");
    272                 goto err_unregister_device;

Good.

    273         }
    274 
    275         dev_dbg(dev, "mdp-%d registered successfully\n", pdev->id);
    276         return 0;

Summary:
BUG1: NULL dereference
BUG2: Stack traces calling mtk_mutex_put().
BUG3&4: Two __get_pdev_by_id() which need a matching put (reference leaks).

    277 
    278 err_unregister_device:
    279         v4l2_device_unregister(&mdp->v4l2_dev);
    280 err_mbox_destroy:
    281         cmdq_mbox_destroy(mdp->cmdq_clt);
    282 err_put_scp:
    283         scp_put(mdp->scp);
    284 err_destroy_clock_wq:
    285         destroy_workqueue(mdp->clock_wq);
    286 err_destroy_job_wq:
    287         destroy_workqueue(mdp->job_wq);
    288 err_deinit_comp:
    289         mdp_comp_destroy(mdp);
    290 err_return:
    291         for (i = 0; i < MDP_PIPE_MAX; i++)
--> 292                 mtk_mutex_put(mdp->mdp_mutex[i]);
    293         kfree(mdp);
    294         dev_dbg(dev, "Errno %d\n", ret);
    295         return ret;
    296 }

regards,
dan carpenter
