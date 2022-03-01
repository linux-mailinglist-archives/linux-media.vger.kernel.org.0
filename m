Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DBE2D4C8BD9
	for <lists+linux-media@lfdr.de>; Tue,  1 Mar 2022 13:42:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234783AbiCAMnL (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 1 Mar 2022 07:43:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46288 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234755AbiCAMnK (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 1 Mar 2022 07:43:10 -0500
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2FC3C24F2A
        for <linux-media@vger.kernel.org>; Tue,  1 Mar 2022 04:42:28 -0800 (PST)
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
        by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 221CPfJk002615;
        Tue, 1 Mar 2022 12:42:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : content-type : mime-version; s=corp-2021-07-09;
 bh=wTzHYlG/nuwjDXe3xOG9yVExyfAMjdEHfz0a8KGtYfI=;
 b=nYapFxtpbFjtBEzm/YqbUNwmsCgiYikrKlg437oAp0HnVXb6dqNKPLVMfZC4zySy15+e
 KpQfFqwJnmIN0ay5fqGh4EeLDZA2aEpM1/Z+FzpMtvkbcdVGFlNGKVpYj+7j2jeMykJo
 TqF1ujl4EJzOpDU78lKZm4EUn/6nI2nP13dHHf/DzC0RCKLZ6rw9kJB5uO2salGY0R8B
 mN3E1AYKmCWJd8KhQ9sFdySa/PyfJuad7sbGqv5gSOAOT0s4gQchO8p0YfYgxNItWNAQ
 YbBDngDNagDvhBdFbgs2ATnzEpVyRjnqhQbMtbjX0QAu23Nr7LYl3y7F2Yz1DtzJgBan 9w== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
        by mx0b-00069f02.pphosted.com with ESMTP id 3ehdayry0k-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 01 Mar 2022 12:42:25 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
        by userp3020.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 221CZLsc175491;
        Tue, 1 Mar 2022 12:42:24 GMT
Received: from nam11-bn8-obe.outbound.protection.outlook.com (mail-bn8nam11lp2175.outbound.protection.outlook.com [104.47.58.175])
        by userp3020.oracle.com with ESMTP id 3efdnmka3y-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 01 Mar 2022 12:42:24 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cfjxqWlX83CIwy4CHGBzqlR31X2w2ZBO5Vo0URD2oe9K3NRY8bB1onW5eTdCMlMcOZXomUYI2q2/CZg6T80RsJ9tjUTwR5yaQDhrCccVK6loc664nFEsX7f/iqxoB9hUH9k6LGzSBd0g1MEx8dzkh2iyfP12qHN8uhgBmEHk7oHV8H8eHq7KzRMhDgnop3uICFfyFrUC9uGEHccW8U1DHwQARYS7u458rk24Iu4ckeHbJ/I37lGcE9zzzoEElIj0MvhQSksnhKaXyygXQ5Y8TZD0EoC+swluZH1u+LBrH0TdlofxDD0H6s8sZWHvzWeZyy+uN98HUlvVC+9pFj1huQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wTzHYlG/nuwjDXe3xOG9yVExyfAMjdEHfz0a8KGtYfI=;
 b=aheO3gIQw7T+QEnYaDIJWYxiM6tpvao4jPnIfEKjWp88LiE7XBvjLvSqGtmhrJcN2ZJdH9wqECkAk4Suyh+Fq9QQ3pKCfzQZuCl1SHTzfVXx5Zjl6TLxF9f0YjMJcvNwpudL1GMsVHZldr/T+Qf1cIWIDd5fMdKGeR/8R34657Mc3aWENQr6LVgkyBQd899320aEy7KLCdYtfBI2OfgvNxQBZR2Atog3vdUKHFGV5Q21W9I2p8NSANzBXvhdMD5/oUCGbg8sBzLmuTMOn4x+h5xSqe9QtsqshO0qITyjJQwWI33HhIFU1nzJOKNkJ1pKP8nnqj81LXVcPmxixGgMKw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wTzHYlG/nuwjDXe3xOG9yVExyfAMjdEHfz0a8KGtYfI=;
 b=KwnDJAO5Jjmq6RBa972QOMZXsb2uXjH+zPsswrfweV4OswP47aoQ7lgO7pq8R6htM+gA7OXmBucrlW/TfZbazfYWAWRMYZd/6vFOXoyS03F++hZbry9Cc6o2VwR0SVymzCtSWb+EssgBzJDZ83nKRGv/RtGIPjQsQXFeRvHHnd4=
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by MN2PR10MB4368.namprd10.prod.outlook.com
 (2603:10b6:208:1d6::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5017.22; Tue, 1 Mar
 2022 12:42:21 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::2c3d:92b5:42b3:c1c5]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::2c3d:92b5:42b3:c1c5%4]) with mapi id 15.20.5017.027; Tue, 1 Mar 2022
 12:42:21 +0000
Date:   Tue, 1 Mar 2022 15:42:08 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     mirela.rabulea@nxp.com
Cc:     linux-media@vger.kernel.org
Subject: [bug report] media: imx-jpeg: Add V4L2 driver for i.MX8 JPEG
 Encoder/Decoder
Message-ID: <20220301124208.GA27743@kili>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
X-ClientProxiedBy: ZR0P278CA0137.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:40::16) To MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2290d7da-9e00-493e-c733-08d9fb80edb3
X-MS-TrafficTypeDiagnostic: MN2PR10MB4368:EE_
X-Microsoft-Antispam-PRVS: <MN2PR10MB4368E3B934572F465CF40C708E029@MN2PR10MB4368.namprd10.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 1qrsv+Lq9NQyGuDdNQS+Lm1WJ/1KWTOrq5f4xnqgkdW5obZpZJkYhT2Uj85WK1vUtV3389sgHRx1Gzha06T7b6Y9DggcbvU/kTBHxGG3WGBadq+uGd1OLEfRlT6PGi/fIxMas2KVlJJ7J8DGY3m6aIq70bYGSZ/trf4dQzuXj09tNUDAbYehQ553UiTTBSLf63XhfUgw3OaSk68Wrc0X/adAz1ViFdNtwVS+vGTPTNDJpZ5b9M/BoeSUOjbJQtazx2IiGgtULD1Wtz1qNT61LSPb7ODgZJg56H2GfeRzaNI5URVctI7DAiY/L28yhOdQkaYgZ+8An+arGoAju5k+dvf05r+jw7UMsiACULzBx9HT0DeToOoQycCqhjgxjMu1nqX0M/mx2oorzchPTsiWhjTSb5Gg1IsyiNfHxsbRKeX0aG0TzVBFesU7imotwDovQsxuyFMerW7TvCNCwvv7XBPhhkt6RGfZuZzTh2jxXAeB29x/+mYnyqzXM9fnNqobN0ac2qBiWNuAQH/tjfabO7A/5+g3RCgNPtjZZ+7ZsAsTeHys9eiaHp4qyOj0bEPKMSWiNWnqRNMtIzZ92g95JyqIx+/juv5wTIg9k9ypxpE6xJ2rM9BmYBdG2E5uG9AfUVvixx52TQ36YXFEdAuraBrGka5X+ex3tNuCA01bgtt4g5edBXcXmgu8Q3WYi+F0LX1JyXYowGYlhvNH7RqRCg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MWHPR1001MB2365.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(7916004)(366004)(6512007)(44832011)(6506007)(33656002)(52116002)(316002)(9686003)(5660300002)(1076003)(26005)(186003)(38350700002)(2906002)(66476007)(66556008)(66946007)(4326008)(8676002)(8936002)(86362001)(6666004)(38100700002)(33716001)(6486002)(508600001)(6916009)(83380400001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?CgYxswGk9CouLjhZcUuXA4rQqCFJPOQPsSn384n2M/YosPBA007NbPZQBPMS?=
 =?us-ascii?Q?UkO07c/sfiI71YSwVwMYVDRndK6KQ6bd58VGrgDQx2t9+0zKnUCCvTNpdgEA?=
 =?us-ascii?Q?w9fQ+IJGXXOxCl7rO7pLs8ANVecrnsG5krVvcWQGpEEDCQnSDKuHVEHO1/vg?=
 =?us-ascii?Q?ZOfJh05bUJWPSkj1lDxhp4Y84wOFub0e230sj3uv+hjy1q+GVLdKEdn3imQQ?=
 =?us-ascii?Q?zbdE/JA0QgUXTnte1XbcrkAWg7LOzL6PbvgIbFkZ9tbWiLMTCQZtB78wn2UO?=
 =?us-ascii?Q?qxlNIagj3T+P1+Zf0hkrMLZ88UUBNcSlfcpNrYWHltIX9NT7cyb7fhPMCmtT?=
 =?us-ascii?Q?mV9UugfeiVVUeLUaQ+bl6AIxXPSmlcQsNXnrNKmCwZ2X8Q2s/EVTpLH9l94t?=
 =?us-ascii?Q?7hZqWJq71J+lWINYsPq3wF64ft1Z5+uUff67UKDZih4ZW6w2PSDaIwDffYDo?=
 =?us-ascii?Q?TGr/q0r6KlPXW0coPaubYDBxWEHIlW7EcnsLXiByZ5jFqG2LJrJH9hnC3iAX?=
 =?us-ascii?Q?YnG8okx8tFTwi6nzyG7PlkZl+QK7kxVgKI80e8LnpQkIZLzmGplAaIaFE/g/?=
 =?us-ascii?Q?VSETYgvpyZrtiUKtDHrYQhrzkS2KuC0dZRRSqKrmJdqNxnSnpT/qEaXBiqSz?=
 =?us-ascii?Q?I4p9BxyypXK5VHwVBiSfQDXkolAX+pwo8w263oKffvGH0NJ1gyLB2KgXq3BP?=
 =?us-ascii?Q?ICFdlmfNoEfJvrNqFvAELplKJvMltNuZx2UMaiw7NcOBD6IDpnxZ42DeMfgs?=
 =?us-ascii?Q?MUNdX5MnqGV4dT10VrPqXsV3cUBPAQ3d/WdEOMihIqEwCwMqYopKUA82pLj/?=
 =?us-ascii?Q?GzgCTOExnfu+6cqvJkhoNaJwRLnQio+1A1HjHGmKcUKMmpo36N83hLVw49mr?=
 =?us-ascii?Q?EQx6i8Fd/dKVDdfaX+M5k9Q8PQT9z9CZ6U+Tqbh30wSv095foPgSlIz7e3oQ?=
 =?us-ascii?Q?YADaxDYklmH39eMZ+29TCmcJGi0YwLxQ7WhJG2SfJKdM1PRrjAkbqoo97Xl4?=
 =?us-ascii?Q?/Lb86f7eo6cE3JOvjfswQVEPF4dDWyXx7upjRXIWFAEL/r2lG/SX1VR9PUXg?=
 =?us-ascii?Q?NTHbM0dfaYTro/04TLNNicxQDvOY9ks/TtgDWtgIR3Ss4jc2kAKmfTxo45Tr?=
 =?us-ascii?Q?48jQ3UHV8R3QFPHalnvhLlU7WlMPT6PHNL7nnTD60C6msxqVjZQF9PpF9OOy?=
 =?us-ascii?Q?UafA7S6L9WB8/5iQIguAXN5QUXkPuW7Gzroq+pVHoAsSF4zz7eX+L9J7IA+r?=
 =?us-ascii?Q?swKYNtx5AvRmkD95xBQ37jeojt2lrreLrQ5eAWc9ooKEKyJZCj7siC9mUZCf?=
 =?us-ascii?Q?Gp9ZV7EkYlpOXDM7w0Ro6abhZ5TSZjwjg4aq2E1GAzACXT+AjNaPbM4v8LQT?=
 =?us-ascii?Q?fQ+7TxEE4t/M10KJCeK5ra/pul8Ju2dGpXEewBn/JXZIIPSze2kAK+ocpoi1?=
 =?us-ascii?Q?/sW2+RLWnFe67JQFMnMYYvuqIswkGseJ4DMc4/yebGUQt7cclyrSNVGBs227?=
 =?us-ascii?Q?LsN4hFx/fSxYOjLLYMTdQCaJbk/B0fhff866QNBBVN2UrqYI0cpTxDNhcxwo?=
 =?us-ascii?Q?EvF02hJTsnYeWTv45VH5/lnt5xSVFpWwwnSUl4kn+Mz9OFSwoitac/g41A6P?=
 =?us-ascii?Q?HJw8JW954PsrwzzHCogwIOuGskGv6djKn8gxxvH0Jf78jSP+jNQCIQd6DbGG?=
 =?us-ascii?Q?RuD6jw=3D=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2290d7da-9e00-493e-c733-08d9fb80edb3
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Mar 2022 12:42:21.6534
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JGCG1epYeKAXee43ddJrVaicgTyx6yIAjBIrONmFj+A/qQIEw2jg3o+HvvSTnfW9vgfdvcDcNaueiuGcihaPkSAPZjqN4QEF2gVQI8HKT3I=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR10MB4368
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10272 signatures=684655
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=864 bulkscore=0
 adultscore=0 phishscore=0 spamscore=0 suspectscore=0 malwarescore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2201110000 definitions=main-2203010068
X-Proofpoint-GUID: f8AV5VqQh17TdcX4dw6Z6srX1CIQFcir
X-Proofpoint-ORIG-GUID: f8AV5VqQh17TdcX4dw6Z6srX1CIQFcir
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello Mirela Rabulea,

The patch 2db16c6ed72c: "media: imx-jpeg: Add V4L2 driver for i.MX8
JPEG Encoder/Decoder" from Mar 11, 2021, leads to the following
Smatch static checker warning:

	drivers/media/platform/imx-jpeg/mxc-jpeg.c:1070 mxc_jpeg_queue_setup()
	warn: potential user controlled iterator 'i' (array size 2 vs 7)

drivers/media/platform/imx-jpeg/mxc-jpeg.c
    1053 static int mxc_jpeg_queue_setup(struct vb2_queue *q,
    1054                                 unsigned int *nbuffers,
    1055                                 unsigned int *nplanes,
    1056                                 unsigned int sizes[],
    1057                                 struct device *alloc_ctxs[])
    1058 {
    1059         struct mxc_jpeg_ctx *ctx = vb2_get_drv_priv(q);
    1060         struct mxc_jpeg_q_data *q_data = NULL;
    1061         int i;
    1062 
    1063         q_data = mxc_jpeg_get_q_data(ctx, q->type);
    1064         if (!q_data)
    1065                 return -EINVAL;
    1066 
    1067         /* Handle CREATE_BUFS situation - *nplanes != 0 */
    1068         if (*nplanes) {
    1069                 for (i = 0; i < *nplanes; i++) {
--> 1070                         if (sizes[i] < q_data->sizeimage[i])

Smatch thinks "*nplanes" is controlled by the user in vb2_create_bufs()
and it can be up to VIDEO_MAX_PLANES(8).  Meanwhile the q_data->sizeimage[]
array only has MXC_JPEG_MAX_PLANES(2) elements so this looks to be an
out of bounds access.

    1071                                 return -EINVAL;
    1072                 }
    1073                 return 0;
    1074         }
    1075 
    1076         /* Handle REQBUFS situation */
    1077         *nplanes = q_data->fmt->colplanes;
    1078         for (i = 0; i < *nplanes; i++)
    1079                 sizes[i] = q_data->sizeimage[i];
    1080 
    1081         return 0;
    1082 }

regards,
dan carpenter
