Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 895724D2D51
	for <lists+linux-media@lfdr.de>; Wed,  9 Mar 2022 11:44:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231167AbiCIKo5 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 9 Mar 2022 05:44:57 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44868 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229540AbiCIKoz (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 9 Mar 2022 05:44:55 -0500
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 31E5B3E5D8
        for <linux-media@vger.kernel.org>; Wed,  9 Mar 2022 02:43:57 -0800 (PST)
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
        by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 2297o45Q028057;
        Wed, 9 Mar 2022 10:43:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : content-type : mime-version; s=corp-2021-07-09;
 bh=70D+38y5M4txxEalZehfRDMW0TzSO5qcpGu9Nv9SNSw=;
 b=hFT8QRD2lbfCrvAzOL9HSzXWaNARWBIbmwUOpRkhLrwlGA3zM/K5CzdmZK0Oj2JIBIe/
 3UAAk0S8i3wxBbrB+CezWtBXAGEk52iq68Gt9HTGpzQZA+1j/iZ+6BgQ99ptKarOAE4R
 8NeIwhHFn6a8MTOvNq99RZxUZOufnK1w1oQSDnxYDazMLq3Fmy5LuwIiz4637un1EJFF
 d5GFaKb9prEOFNGNlOs8510z8Fb7RaNTqFUo431K2nw4bbq/O2p2fUTPuyHHG5qiERTK
 EUXSspCyQmjnG0CVCbZcPKH2iYm3T+RITzisPeNRXrmOMZj9v9tqTnKVyWVMdDHmm0fv hQ== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
        by mx0b-00069f02.pphosted.com with ESMTP id 3ekxn2hsw2-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Wed, 09 Mar 2022 10:43:53 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
        by aserp3020.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 229AZSll190837;
        Wed, 9 Mar 2022 10:43:53 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11lp2170.outbound.protection.outlook.com [104.47.56.170])
        by aserp3020.oracle.com with ESMTP id 3ekyp2vmhe-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Wed, 09 Mar 2022 10:43:53 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gmw9c02sMWh5tvxnWZqG1Rou1xnaeuUzyKRAeTTy4BWEB6f42uKe9QiAcJE/+axE2w8atMUm4hr6oNgLcOg8arm4q1RXw5mo6sDXcM6vGEY1NZmreYm+LPRY+1kTGA/PodGJbMBYfAGPXWdfJdf3gB1iIQ0NjRhI0tBMtgNnmrzBKKtxScP8jgq8/OajvFQeAX4QdvigAG2XDK08XIzyttjT2XdWKtHiPtK6qin0QZzj1o/qkIOSBJKPZdcNSohTGQgdppbTrSl4HEH+BHVFgqQkZHxeAQqlwWbM6BLl7jWXZHjb5i1FtnT30W1JoNjEDNKESepTjYt4vIonMgNlNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=70D+38y5M4txxEalZehfRDMW0TzSO5qcpGu9Nv9SNSw=;
 b=DU8ZpQGNe16ux6epJT0akV5QlbCNiAvoFeLkAmTGez2HFvZ8sUkfRgw8P4FCxwW+i4VuruSANKkoZbBJlMN7l2uELdF8jDj5pSmJg5V9gRWQSAxcMyTvzzlL3FRzbqG2pUfEZeqlSKx4jK1hhe4f81WTVXQ4FS+uKOcn6bfZ2OVvtj+uS7thaZ2v/QI6bSJ373AFdnSlFue9+6+FWnNdR8WkpRhV/Q4WcY76ppo/6b55ghQpHFCPWglwV5VEUgLUN890YUvyoWZ4otMqM2LCmBLdR3a3L7yJ0WQur2utdROoY8a87pVYNOzZxKRJoL4X/HFCirfKuGAHtQoVxpSZOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=70D+38y5M4txxEalZehfRDMW0TzSO5qcpGu9Nv9SNSw=;
 b=d6Otg2LRTk2iQ57a2YWhAtEPq6YxsIWysK+7nAWeBHo8Ma6Ij9IBWv1+qeBa9HdLJIhfk/jxQKet+DnZHYeGbkiP5fSzxyWJA6f1t8zuRlwITqFPUPnCnKh98a3hlGLFLv9A4Xen8Sx5EglrDZsPjvJaEr/97lClc5vH46K7KgE=
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by CO6PR10MB5475.namprd10.prod.outlook.com
 (2603:10b6:303:13e::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5038.14; Wed, 9 Mar
 2022 10:43:51 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::2c3d:92b5:42b3:c1c5]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::2c3d:92b5:42b3:c1c5%4]) with mapi id 15.20.5038.026; Wed, 9 Mar 2022
 10:43:50 +0000
Date:   Wed, 9 Mar 2022 13:43:37 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     ming.qian@nxp.com
Cc:     linux-media@vger.kernel.org
Subject: [bug report] media: amphion: add vpu core driver
Message-ID: <20220309104337.GA29869@kili>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
X-ClientProxiedBy: ZR0P278CA0162.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:41::13) To MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 27bd8a94-6daf-41fb-71b9-08da01b9b2ad
X-MS-TrafficTypeDiagnostic: CO6PR10MB5475:EE_
X-Microsoft-Antispam-PRVS: <CO6PR10MB54756424FF77E05A44AFA7EE8E0A9@CO6PR10MB5475.namprd10.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: TFRDoYxUAoHGXXEbEftfY4HFr4eBgjfWC1kwgSPSPsAjOyMOwWvwyFsG2mSQjHMAbbbrQdCCcHTPNRl+8fZsY2xh0talc4QMXNz7h4Fl9wts9Ix0b0i+yGZONr8gfimPdY2AGgybsmJdZA0pSuTD+X24SmtWPdbwYxZrtSAuydV7py9IFdqIUTde22HxUkWT0IwDPEDatPvcafah44QtCwxu1cH/Vxoq99RCSyl3n+0n/KFKT0cPPZl3QxfVD1aaq4Ok9rqo7eGjF2xal3va9BTBIap+2IhvxNcfFMd8cxmFUYqs2fb+0oD606CJaJdLV/vEj8QwL6L4oeP1NxGDskS+lmrBMwaE8EL7Qtxva9RmopyoeuWrZshoPYt9mhYgpRU3gtP6hFwwfG/YXVoyz84NxF55nOGFkLyErZt+Qwzq84avc7azH8KniihjYDwLpqcP09Kau0bjMeB5H1epGQcaSNddN+wJ4eBvQb6DcrwswyA+876WX2ZQ1vqmv+AP2XWRHQiTD5fiCTB0fxbhACNhCB8eHfcuLXycKoQJkN0Prohj0Vnvjnjt2JUP/M+91h9mTqN4K+dUjQM1Bc581XvMuZOFkS0Csl190D6jzm+SPe9elxK3IyhtmCzy0kHPbiM0oQ1XxfLfsXUAeUmbFMkGZRB7dTQHUECk20dZxxn+ILS/1GvDgxBi4p0N4F3QMU0Xxr/EdRnIR4Yiv0t3DQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MWHPR1001MB2365.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(7916004)(366004)(508600001)(5660300002)(38350700002)(38100700002)(86362001)(6512007)(6506007)(9686003)(33656002)(6486002)(8936002)(52116002)(83380400001)(44832011)(6916009)(186003)(6666004)(26005)(316002)(4326008)(1076003)(8676002)(2906002)(33716001)(66946007)(66476007)(66556008);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?3bw+1nSol8Xflg7rCGtpgNa8WBrlcTCq2CiE55R4elwHZuatQhI4eR7uweyy?=
 =?us-ascii?Q?K8qUgbOrSgnA7zUmOdCemyQWe1orMipqpSYIb3YkmhGiVVEgFLgZZwZN6n/H?=
 =?us-ascii?Q?KPsnFxyiYayDluoZa7qTIUQ1HpY3QlrPVD6CFfFYb3oRcN7kHr7Hfjn6stkd?=
 =?us-ascii?Q?hpjUvLK0C+nPUpz2f3YyA9mCf5N0IRF7rpih6OulyZ2M9BdgWr93P+paCwV9?=
 =?us-ascii?Q?mNkp1MPtiXISqIEu+m+7TQhmenVIAC29CgeXe1cWn/3dlN5jhzirhDB71WmG?=
 =?us-ascii?Q?jj/P1sHIRQXEI52SHUF8e3OL3/E+hym9nYDWAJn5MMBXbmyvYth0C8BGHAyk?=
 =?us-ascii?Q?eopfl1BY3Of5cWVgHILojh0HqJvuw5J5PsXIKi5LJZGC8FyixuR5AlA9ACmD?=
 =?us-ascii?Q?/suUCTUIOc7HsoV5veo+MqBXcxusGDq48M32EPKQfebSH4P/TaqleAzi4702?=
 =?us-ascii?Q?vpnAMvM96Z+FyVfcb1FYqH88my420jWEJIo7ET/Ag7t5fMJmvYTI3wJGwsoG?=
 =?us-ascii?Q?gazMeF+au76BAIm7A+hI4A96OxeoPzA5dKXSfQQbmnxXUTW8qjUDJk9s3LGI?=
 =?us-ascii?Q?1IwBokuIX8W6Ji2gLO0a8sPYRwG+Zv+Vf+AOmVng5IYPfWV9qynB8wtmqspg?=
 =?us-ascii?Q?My1vFMJ2Z6ZDF39NY37MmTmo5nGBVoeqqbllfJgKu9EezLfv8gCPOaqWbdSg?=
 =?us-ascii?Q?G90/dt9eSp5m3yq3DoNGptOT2CgkSWkJMXk7fDDBpQD8ncbtV5s8oZWS6Z/X?=
 =?us-ascii?Q?KxvHxQqFivjJEedbWdySGEhSJbii3k7BrBAZD8+Eqp0nwRu6+ZTl8qWTf5ef?=
 =?us-ascii?Q?Qb9q1GcGnL3w42rre6yBJIQHRmdL3ktPJwIgyavj8QDQuiNdMAS+biLpQwEe?=
 =?us-ascii?Q?ZnmfHcPLKU8igrl5m0JQUMfhb+Np+4TADrDy2UVCbi8Tjsk90PmfXfTFFfFu?=
 =?us-ascii?Q?4YfgGO39puQBMF0NoVEGsY7mLB0eeSYA1DCRVh9QjoBu+ezDxSFwFn1MmkT3?=
 =?us-ascii?Q?+BjloTPvgfadNQAKYNGyy1I8V3z5dZkO21ISwqwJCx+ELUwXIA7tXcRUVRJK?=
 =?us-ascii?Q?ZZqZixjwjYcM6nUkoeelrYyUPuSeF8bv+ngMvK2K11gHnpbGwsfY/CTfPDd3?=
 =?us-ascii?Q?Gk5lOMvpmrojuS3/2PdFFfw8K4sIhDzU9mSo2lXXe2weDU0jCR14yzC1hu39?=
 =?us-ascii?Q?VCRcqly922QrNTl3L0bTrd8ig2VF9nmZo5LhR/qXXYyPXcVTd0yci1/YNdfa?=
 =?us-ascii?Q?QYGa4r3ERT6j7PtYpgVKgOpxRkoQ6TVOmPx2KUy03a8/P4UdZOgKhSQHxxf7?=
 =?us-ascii?Q?Dq5wY9Dq+I2K+YY4WS9YaLjt10G8hbx2MbSrQQ4A/931O/OTwsyd5i6jgnkJ?=
 =?us-ascii?Q?uwixAkkHrYZG76dX3L0Iii/lzy+Hazotelf1n2K+G80M/dI7t6MHTRNFwXcT?=
 =?us-ascii?Q?QTllpFa4TXQCDqB4YsscANBFMbFYJqvq8hZmuiao41B/l7toKL2d3GbKwL5f?=
 =?us-ascii?Q?MsjBTMNIg6HVCOWtceOnWXP8A/zqXBpOBPr4lUqkpZGN4lhaYLQQ1f+bwRSd?=
 =?us-ascii?Q?2WZoZTXlLNt/0DkPYUuBqdZ2O2MtbVJ0aDrmZRZBfaqozoTn/G1kv5wAX5FN?=
 =?us-ascii?Q?/3ST0Am4i46xXtxLMACBvT9S2rW2nZ3/aTr543OYKW6UDcabkWqHIpYTlmo4?=
 =?us-ascii?Q?ZK97LA=3D=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 27bd8a94-6daf-41fb-71b9-08da01b9b2ad
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Mar 2022 10:43:50.8228
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cdTaZ77t7LUBzmLfq0NvDafrVhZ4/o5n9FjF+4J6EGSCvfL4LlnlTovgjgeeorSC7PPDdly7nDUk0cVgDIQ5COmW1eSMnCr6qCByF3Pz5ss=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR10MB5475
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10280 signatures=690848
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 phishscore=0 mlxscore=0
 bulkscore=0 mlxlogscore=999 spamscore=0 adultscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2202240000
 definitions=main-2203090057
X-Proofpoint-ORIG-GUID: 7QhIXo2kFsV8DonLLNq9EMwQ_OCt0ZYl
X-Proofpoint-GUID: 7QhIXo2kFsV8DonLLNq9EMwQ_OCt0ZYl
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

The patch 9f599f351e86: "media: amphion: add vpu core driver" from
Feb 24, 2022, leads to the following Smatch static checker warning:

	drivers/media/platform/amphion/vpu_core.c:654 vpu_core_probe()
	warn: pm_runtime_get_sync() also returns 1 on success

drivers/media/platform/amphion/vpu_core.c
    577 static int vpu_core_probe(struct platform_device *pdev)
    578 {
    579         struct device *dev = &pdev->dev;
    580         struct vpu_core *core;
    581         struct vpu_dev *vpu = dev_get_drvdata(dev->parent);
    582         struct vpu_shared_addr *iface;
    583         u32 iface_data_size;
    584         int ret;
    585 
    586         dev_dbg(dev, "probe\n");
    587         if (!vpu)
    588                 return -EINVAL;
    589         core = devm_kzalloc(dev, sizeof(*core), GFP_KERNEL);
    590         if (!core)
    591                 return -ENOMEM;
    592 
    593         core->pdev = pdev;
    594         core->dev = dev;
    595         platform_set_drvdata(pdev, core);
    596         core->vpu = vpu;
    597         INIT_LIST_HEAD(&core->instances);
    598         mutex_init(&core->lock);
    599         mutex_init(&core->cmd_lock);
    600         init_completion(&core->cmp);
    601         init_waitqueue_head(&core->ack_wq);
    602         core->state = VPU_CORE_DEINIT;
    603 
    604         core->res = of_device_get_match_data(dev);
    605         if (!core->res)
    606                 return -ENODEV;
    607 
    608         core->type = core->res->type;
    609         core->id = of_alias_get_id(dev->of_node, "vpu_core");
    610         if (core->id < 0) {
    611                 dev_err(dev, "can't get vpu core id\n");
    612                 return core->id;
    613         }
    614         dev_info(core->dev, "[%d] = %s\n", core->id, vpu_core_type_desc(core->type));
    615         ret = vpu_core_parse_dt(core, dev->of_node);
    616         if (ret)
    617                 return ret;
    618 
    619         core->base = devm_platform_ioremap_resource(pdev, 0);
    620         if (IS_ERR(core->base))
    621                 return PTR_ERR(core->base);
    622 
    623         if (!vpu_iface_check_codec(core)) {
    624                 dev_err(core->dev, "is not supported\n");
    625                 return -EINVAL;
    626         }
    627 
    628         ret = vpu_mbox_init(core);
    629         if (ret)
    630                 return ret;
    631 
    632         iface = devm_kzalloc(dev, sizeof(*iface), GFP_KERNEL);
    633         if (!iface)
    634                 return -ENOMEM;
    635 
    636         iface_data_size = vpu_iface_get_data_size(core);
    637         if (iface_data_size) {
    638                 iface->priv = devm_kzalloc(dev, iface_data_size, GFP_KERNEL);
    639                 if (!iface->priv)
    640                         return -ENOMEM;
    641         }
    642 
    643         ret = vpu_iface_init(core, iface, &core->rpc, core->fw.phys);
    644         if (ret) {
    645                 dev_err(core->dev, "init iface fail, ret = %d\n", ret);
    646                 return ret;
    647         }
    648 
    649         vpu_iface_config_system(core, vpu->res->mreg_base, vpu->base);
    650         vpu_iface_set_log_buf(core, &core->log);
    651 
    652         pm_runtime_enable(dev);
    653         ret = pm_runtime_get_sync(dev);
--> 654         if (ret) {
                    ^^^
This isn't right.

    655                 pm_runtime_put_noidle(dev);
    656                 pm_runtime_set_suspended(dev);
    657                 goto err_runtime_disable;
    658         }

The documentation for pm_runtime_get_sync() suggests using
pm_runtime_resume_and_get() instead.  I think you can just do

	ret = pm_runtime_resume_and_get(dev);
	if (ret)
		goto err_runtime_disable;

    659 
    660         ret = vpu_core_register(dev->parent, core);
    661         if (ret)
    662                 goto err_core_register;
    663         core->parent = dev->parent;
    664 
    665         pm_runtime_put_sync(dev);
    666         vpu_core_create_dbgfs_file(core);
    667 
    668         return 0;
    669 
    670 err_core_register:
    671         pm_runtime_put_sync(dev);
    672 err_runtime_disable:
    673         pm_runtime_disable(dev);
    674 
    675         return ret;
    676 }

regards,
dan carpenter
