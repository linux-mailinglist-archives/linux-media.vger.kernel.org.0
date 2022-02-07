Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7D7D74ABED1
	for <lists+linux-media@lfdr.de>; Mon,  7 Feb 2022 14:22:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1386441AbiBGMs3 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 7 Feb 2022 07:48:29 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46646 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1386439AbiBGLei (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 7 Feb 2022 06:34:38 -0500
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DE4E9C043188
        for <linux-media@vger.kernel.org>; Mon,  7 Feb 2022 03:34:37 -0800 (PST)
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
        by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 217AwxdF032056;
        Mon, 7 Feb 2022 11:34:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : content-type : mime-version; s=corp-2021-07-09;
 bh=SZF9iJOlqxwJAu9mQhlmNznU/foQC52gLkZy7Q9bDRg=;
 b=zglVbVbiROb/b5hiIiEqO2ZulpGmRcvnosyDdfKhF+Xpq2uNz4i48ueer9daDgZSxEM4
 vFXfDjyE3UA2kE0aSw71Ls+GjuGWRXt2DOh9IBfk0ELAYhrbq3ipJqccqohRrrX/qc3f
 lN/iwukiyXZCg9pMkC1ySDpL6H4ZqMeQGfDV0D7J5TmQ1R5kkTf6OzyLwad6lczKxwRG
 s1XBXLPvwQjyXVrf3BnhEikggn+1WrdS3ipBu7JXxp5xLoBrlJxJ0ccBNxQL++eBeEfC
 G6clfeRoODOpcL8yvgMkdgHXEHTUj/qS5rl5EF3nTpys5EwovovAfJMp5uzGosIufR2Q dg== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
        by mx0b-00069f02.pphosted.com with ESMTP id 3e1fnddq20-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Mon, 07 Feb 2022 11:34:36 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
        by aserp3020.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 217BFTkd070856;
        Mon, 7 Feb 2022 11:34:36 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10lp2104.outbound.protection.outlook.com [104.47.58.104])
        by aserp3020.oracle.com with ESMTP id 3e1h2465pn-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Mon, 07 Feb 2022 11:34:35 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NPbHcYpWEq8D+GJSRwJUFFx9H/38TRS4cSUOzVzVV1X20pOVcPcJA/cltOu76SKor97lGlJkRftoOLkFKIW8opbrkXkDpCqR8AgwfUGn1Lw7us2c5B7c2oHe9nOxm+1EiBBBt24eGNe65nwXUnk2yW//wdKcU4moeV9Sprh5yLz1FulEteFkKtgFF5m3167YVw/YDxoVF2zBjJ7V3JIXjW6lZ9pGVaFLAeIzr9B7lmkwbUf+nQUCidXONw2DeBGuOY2kV60y/YPh7+AazAMh0vLuhn1BDX2pEwJpYGE4nGALFuJPvbf7isFXjeZuh8hddVuTIX9N+xH+r+Z3/VkKRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SZF9iJOlqxwJAu9mQhlmNznU/foQC52gLkZy7Q9bDRg=;
 b=hQf4dYxHp/o3xiNcRaxEtOO5V6vM3/XQ0O4nMYYnaAXrxbVlGWLkqKStTvPPQAxIGiwWz8C4tiMU22tH4yy8wLRjKWuAgPfr7HhHkE+6VKvAxUrGzszqZ5DYguzxdwPQn2YBdjULuohrCaGiizecshHNR1VoJUEnL165Hm9ekchwcK6V7mQACSOsmkdIqAbs8HT70/KuWZP43qGs4DpTRH7JdsfcminD+BiuE6UrWQuPSDHkDzHKOmLhOn9V0gEY2n7ADhTensEHVRBoUDa/W7mFWwwfLiIcLCuDjFwwy9ccL8i+DxX53mL2dlQLO4g6TGg7Xwa/batXSGy2Wl8tcA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SZF9iJOlqxwJAu9mQhlmNznU/foQC52gLkZy7Q9bDRg=;
 b=O2fMk0MT3ALcp5ufbrDadUQxgBIHT/iabBrrVOLQTXN1izFC5YKljeugMhqDEXIcjm00YHGIg1iiwyZ81QnjqRe6WLvcmZD3UxY23F1qk/nIrRtZ/6KLq5c+Z3BDcjC2hcdVcNg08W0TrtMhaDm0QRuWznFrNk0HzSQXGcHvfbc=
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by SN6PR10MB2768.namprd10.prod.outlook.com
 (2603:10b6:805:4a::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.12; Mon, 7 Feb
 2022 11:34:34 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::e5a5:8f49:7ec4:b7b8]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::e5a5:8f49:7ec4:b7b8%5]) with mapi id 15.20.4951.018; Mon, 7 Feb 2022
 11:34:34 +0000
Date:   Mon, 7 Feb 2022 14:34:24 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     hverkuil-cisco@xs4all.nl
Cc:     linux-media@vger.kernel.org
Subject: [bug report] media: v4l2-ctrls: split up into four source files
Message-ID: <20220207113424.GA28058@kili>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
X-ClientProxiedBy: ZR0P278CA0055.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:21::6) To MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8cc63190-bf8d-4d34-448a-08d9ea2dd055
X-MS-TrafficTypeDiagnostic: SN6PR10MB2768:EE_
X-Microsoft-Antispam-PRVS: <SN6PR10MB276878352261F84AE2EF4F0F8E2C9@SN6PR10MB2768.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: f4+9K5TxWBSKgCsVwLsjtQLJXXbix/XtnpqcK+5rZjXHp8sg/48yg8/IY2HNIdpyMNYdLDM3V3JW7JL78qTK1e9AsSsgVjZdJ0cHneMW8eJpCM8Fusl8lSsiyMm31aM+WJuFSk5jY1Jg922rmWUPVW7RlkPMUU1xQGmx8b1jxL66pQXF9vvFfKnpGDNQytAUQ6DscficaFmh1Mow18vBwYqjv8j/nZh+0Es0jdI2sEb+1MUT1bDmRdYvGqKvNgqB+42UbMDNT9MQVPspi502MfGHAySAzIEScXCag+2+wca7YkP5ebCAxrh0k9phTW3WfpiOJYTNntYQ7rrsofWquT36jF7/W0gcxhAgsqJ9lVrEIO/nyoJ8ZQHNZEHPquelXRmh6UjMABXU6EqLJ6N/YMe7TamoMXfb2sVmdZvK8aJT6IaWc3fNhLyOihax02ysimbMzhwYETVD2Wxw5vYc8ICZ7omms42x8BCc+xkBR810F5G8SlepTHRX0+OWdggmMSfMHDHUXXYZKzEJyTcTA1z+RhdbBCOUsQKKhNLS20DtjB1v4XISDpXi0ktGqLF5jZiDXYRd/8ChFURJglSia+cLSnxO3K8tkvii0SRzJzw2AsHiYCJL+P/t9exXCIgOfNlGgds0hSo1MmLhvd92BrcG4mJnS/y3uZFv3tPYIRPlpsSsPh1JcmsSVVMHKE/2gjErlUPP8w/CZln16ysSdA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MWHPR1001MB2365.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(7916004)(366004)(52116002)(44832011)(186003)(1076003)(9686003)(6512007)(26005)(6506007)(83380400001)(38350700002)(66556008)(8676002)(8936002)(66476007)(38100700002)(33656002)(316002)(6916009)(33716001)(4326008)(6486002)(66946007)(2906002)(6666004)(86362001)(5660300002)(508600001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?tXGAeI4QduEx4QpmrRrVn+zBSdjOXL6bBcJP4u7kaJw6gPEre9RqR/sGFKIl?=
 =?us-ascii?Q?Ouf6bR3Bkvl6GW1iPpQezgf7PLwJF2qEiY2cFIK0rk5/ZPV49u9cYrbjZtiG?=
 =?us-ascii?Q?gEId5jCxX9gm1xy0ejSKSLDmR0SC9uhdcdymv1wBJrtYyRUmYNhdVTVPttRU?=
 =?us-ascii?Q?fmyO4blRX3CwZoDwkO0DMjq8WqRSfBqCQA4RS+QwFONzsxOfz60S0gkj+hcF?=
 =?us-ascii?Q?lgBKscjOvvLTilStGvz6du0uMta8AcPtzKK5Gnwo1ZfN2IOSY0U+I8zQT3ud?=
 =?us-ascii?Q?kPlgjGu3sM9iXKL9j42Ig+qqV+ZIl9T6rVZm+MwyS6iYvHmIOnGLOBCvxd7b?=
 =?us-ascii?Q?BLxSC3m5HqFfm78uvdmylSJz5PJiTleXmLl5jw0f+7fZulCXeIoDumVcj9z7?=
 =?us-ascii?Q?J3YmLDY+GGSB1f0Poq29zrLbTHzUHGQnB/6v6csZPOfk7VcRYqKcsjZVesfV?=
 =?us-ascii?Q?6i8/KJsxs0pv7esgoS2MPeTlE50k3ZWXm0FIzi03BREEdo/ZtpxYpjDAYmkr?=
 =?us-ascii?Q?79YVesELzC6ZTAly2xfGEDrnnNGqKWlyjpQKJ5s0suK8cH3Jqrd0i0MnMUCy?=
 =?us-ascii?Q?pIujhnkv/6WVf/ovCuKnIaYrofwOstmkGVOUQH1ElPqWj/G3bfOlgFkXYnUp?=
 =?us-ascii?Q?j1j9u4VpXYUt0DIt6iWcInkF99HsL5tGxI40WD/gtDds0DmbVi6+mx7KeP2D?=
 =?us-ascii?Q?hZi7aSn/0/EKuuaVwIQxs8ZBSgf9T86gIz1qybRNQ3Tdl0NfML0DqP3YkE8U?=
 =?us-ascii?Q?ALzdtVV2KWsY3F6klBIq4TtH2Fo63toxqPh8e8na7SyqZz8rDy2ZGFkrATBM?=
 =?us-ascii?Q?SXbvPRJYHLuWLoPBj61ulTnQQ6dgvJgatgyr8u02RQ+upLEePVenFZaCKqPH?=
 =?us-ascii?Q?qF2p9htMSBZqJ8eoTlPzYJunaXPzLrwmnW206yXf6BRMirU3/yzxtNqlWhJY?=
 =?us-ascii?Q?Z408/nWcjATCx1CYtCOiMZRKTCnjOALP3G6Tj3Wf9RviOMgNabbWNwAN0Fhu?=
 =?us-ascii?Q?jcNUbnIL6PS38G9WB5nqD4eovrHS2uyS/sMAKPc78JkxW9XXhMLfgnJgFRON?=
 =?us-ascii?Q?pmoBzsBjUm/yy44Vc/41IyF6GvqgQjAFWCRcV6nQ3C4U3LSuglH7IUtFDCBZ?=
 =?us-ascii?Q?B6IMtxqcaKPFlorrGlpb4JQASsxXvozf8XvEnXQ8k1ZpI+eM5mWLEi5pg+y2?=
 =?us-ascii?Q?mkqJ6jxNDiYjUnNkS8k2onmtDxK/pDbYvJLn7wEBzw1c/O0nNoVvvFtFtrsx?=
 =?us-ascii?Q?H0QipXZACRjjQn6gD/YDwbEFGuhfHW5z2nNNlfPMTNfsr1VSY1Qrw8ofoo+T?=
 =?us-ascii?Q?KamJ8waPEyqD5TrUQHn1SfPeGU1jn40n2ePrv/AbRYHXQosRmylt7aYe/T92?=
 =?us-ascii?Q?80+zaxgeyWVI17kUnG3MsXxJ+GqXlCzebEhmGvNeNzJw7YJLKtPlVq1DbRvF?=
 =?us-ascii?Q?5xJ85VXYigXyp9tSrprb5gYF+H6zHdQCLjxO8MGu+qAH20nHzP16BFID/Puh?=
 =?us-ascii?Q?hiH9Z3PwoXm5KbElWGXtKUJsLkl0sS6I5tT8LyzQDtRap64ww0eQ7/VwFbn1?=
 =?us-ascii?Q?YtfG/X1BLhUElNHDeh5JM0pNLER2VuGLlLV6EEeu0jhUTYDoTssn7j37HuwQ?=
 =?us-ascii?Q?TlJRRjwWkb+SIRMzWxzjhsYFG5DC5idHYXnaSsEzvrEyFOemb0X0ci1QvfC4?=
 =?us-ascii?Q?8qRGWQ=3D=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8cc63190-bf8d-4d34-448a-08d9ea2dd055
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Feb 2022 11:34:34.0406
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FVOFL7JTR0v8A8f8NZ5UKvCgnAJc1BZhhRKzyV+y6YH/KIILTIWop/LVsSbRxkR+NK1W6HWtIPw3hRc7q8+igO+SJu7jY2YceschtPCX0F0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR10MB2768
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10250 signatures=673430
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 mlxscore=0 bulkscore=0
 phishscore=0 malwarescore=0 mlxlogscore=862 adultscore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2201110000
 definitions=main-2202070074
X-Proofpoint-GUID: -GIjiZUnakkF_CGBgpw0yDz2WQ3GyVRw
X-Proofpoint-ORIG-GUID: -GIjiZUnakkF_CGBgpw0yDz2WQ3GyVRw
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

[ This code is older, but it showed up as a new warning because of
  moving the files around - dan ]

Hello Hans Verkuil,

The patch 71c689dc2e73: "media: v4l2-ctrls: split up into four source
files" from Apr 27, 2021, leads to the following Smatch static
checker warning:

drivers/media/v4l2-core/v4l2-ctrls-api.c:374 v4l2_g_ext_ctrls_common() warn: uncapped user size for kvmalloc() will WARN
drivers/media/v4l2-core/v4l2-ctrls-api.c:545 try_set_ext_ctrls_common() warn: uncapped user size for kvmalloc() will WARN

drivers/media/v4l2-core/v4l2-ctrls-api.c
    351 int v4l2_g_ext_ctrls_common(struct v4l2_ctrl_handler *hdl,
    352                             struct v4l2_ext_controls *cs,
    353                             struct video_device *vdev)
    354 {
    355         struct v4l2_ctrl_helper helper[4];
    356         struct v4l2_ctrl_helper *helpers = helper;
    357         int ret;
    358         int i, j;
    359         bool is_default, is_request;
    360 
    361         is_default = (cs->which == V4L2_CTRL_WHICH_DEF_VAL);
    362         is_request = (cs->which == V4L2_CTRL_WHICH_REQUEST_VAL);
    363 
    364         cs->error_idx = cs->count;
    365         cs->which = V4L2_CTRL_ID2WHICH(cs->which);
    366 
    367         if (!hdl)
    368                 return -EINVAL;
    369 
    370         if (cs->count == 0)
    371                 return class_check(hdl, cs->which);
    372 
    373         if (cs->count > ARRAY_SIZE(helper)) {
--> 374                 helpers = kvmalloc_array(cs->count, sizeof(helper[0]),

These days if "cs->count" is larger than INT_MAX it will trigger a
WARN() because basically "people shouldn't be so trusting of user
space".  kvmalloc() used to be able to allocate more than INT_MAX but
that led to integer overflow problmes and security bugs.

This "cs->count" value comes from the user via the ioctl.  I don't know
what a sensible upper bound is though.

    375                                          GFP_KERNEL);
    376                 if (!helpers)
    377                         return -ENOMEM;
    378         }
    379 

regards,
dan carpenter
