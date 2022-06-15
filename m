Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7F55854C361
	for <lists+linux-media@lfdr.de>; Wed, 15 Jun 2022 10:21:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242081AbiFOIVP (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 15 Jun 2022 04:21:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55864 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243978AbiFOIVN (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 15 Jun 2022 04:21:13 -0400
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 701552A707
        for <linux-media@vger.kernel.org>; Wed, 15 Jun 2022 01:21:12 -0700 (PDT)
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
        by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 25F7130e000848;
        Wed, 15 Jun 2022 08:21:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : content-type : mime-version; s=corp-2021-07-09;
 bh=s5LVRO9AIUlE3HEhsD5iZPKYTub9JJWNvEFZmfuIrcU=;
 b=kVBwFJgiVqgIbtFIjlJk0P/1lNzZ13XM+2y+IvHT8PfboEoQyqknCB02jWtSnKRfA4mV
 C8RRuG0uHWMudCU5Fxq4qvHKIHmYu98YnzQASU+MGRo0dOoMdyolAlR8kLcEgWNozvUK
 rrRZxK2S1bqaK/VIYgsy3QK16O5HAKIeq81UF/4vF0KmHZpbNh4fKmOoQ2poC0yW1+nb
 yrQ5pDtLFcGLcRkGY6k9tvQjR3+qyP/cZ/1d9d1FWe1SNCrmj2QvqUZU18dYOb5abNXQ
 L3n192JfK+iwDw7mSkzm1vqgqqFQ9pz5IvyPbF8uz5El6OeNEyRvq2jurMWzbfFqmbNQ Dg== 
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
        by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3gmjx9frnq-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Wed, 15 Jun 2022 08:21:05 +0000
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
        by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.16.1.2/8.16.1.2) with SMTP id 25F8ADWW009639;
        Wed, 15 Jun 2022 08:21:03 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10lp2100.outbound.protection.outlook.com [104.47.58.100])
        by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com with ESMTP id 3gpr2a0cct-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Wed, 15 Jun 2022 08:21:03 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZuIqZGkRslsBfQDi1yRwYA78fGBXKi1xAo9JgtN1zRPARfP/bVPuiZTlVFiJjrb9J4nue5/+f9TPBCZEBh99HkIpINTXpWsvGR1bDr1xf2g4JUrCOQBo48yv+e/j1q45NlO7ur2d5a70BSzx47cUalXrXWvwjJuXa3JfdNd7acGhet/4TMxvWkH8CU6aDPefelbpnpbET/m7rUIRTSDCBTWW4guqj9da7a+W01H0vtmuKTOtnIbPbtL/fywUgWGYKASE9B9czWy9S5GVbeLd59hkD+C64Ls4UVAgaamTqxtNcFzQHl37ifz/vS2xvC97RQNTtnZlg6GEZZVj7Amqug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=s5LVRO9AIUlE3HEhsD5iZPKYTub9JJWNvEFZmfuIrcU=;
 b=ccJpSqXBPFjGrybyhV4gKuc2xSxhM4LJuAeJvOGzEw+NRxdJrPJ++7OQ/CNIM6PSvvFfhj7a0NW5HrfCN9YkYiss/sHGBcXGCB7wNhTqGL4GfGVdq9XkovmFn1l/BO6WFSIpuA0pY/KrFEKKt8vnQ699fqH0OivLJIrAQgWVVuR7UBw2KeSbLpBvrFFPiIi21yCA/N95bWbKof8YzVY3wLew9HxhiRB9feKNHrreukWmSwjyZp8gb37MRKNN1udn9G+Uz3vNAgW3QhISY+RQr49SDkJ6hIlWXX3LYLOKiVWQWXc01AnQ8TApxF783+VsyJ6VGjjN2w/01KzGLuGnFQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s5LVRO9AIUlE3HEhsD5iZPKYTub9JJWNvEFZmfuIrcU=;
 b=oNKdBRyUm/2DgfySN2vMdLMRFvdxvPkKMJuOLW7pSKESrRP+zkysfY/lKWMeACQffaJCCIJoNWt8ePEq9HjcNw2iB2hGzpIrmcpRUPOtOoiAPe2FmVFQrnrDQxZ6aMKIb4cveaOBiECO6ltPjqdVvFskXd4iEdOD72rpwhQfjfE=
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by DM5PR10MB2044.namprd10.prod.outlook.com
 (2603:10b6:3:110::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5332.13; Wed, 15 Jun
 2022 08:21:02 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::5020:9b82:5917:40b]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::5020:9b82:5917:40b%6]) with mapi id 15.20.5332.020; Wed, 15 Jun 2022
 08:21:02 +0000
Date:   Wed, 15 Jun 2022 11:20:51 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     p.zabel@pengutronix.de
Cc:     linux-media@vger.kernel.org
Subject: [bug report] media: coda: jpeg: add CODA960 JPEG encoder support
Message-ID: <YqmWY0MmKWTsAL4D@kili>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-ClientProxiedBy: ZR0P278CA0141.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:40::20) To MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4dd0f581-d5f2-4e11-5274-08da4ea7fbfe
X-MS-TrafficTypeDiagnostic: DM5PR10MB2044:EE_
X-Microsoft-Antispam-PRVS: <DM5PR10MB2044F05CEEC41E618DA250818EAD9@DM5PR10MB2044.namprd10.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: yy3NHUYQcWsjTrm1FWFCW3wIoHUL3rloCcXnFjxPogLIoxd9ojOmKmT5lyKZ3BEVqFlqO2QhAuSbN58e9YY6QSArVHop/sp8mbKq1GXdG+K78b8V6l6MTHxm5V8suK3B+Tx7zTnaa6xiHWiCSgUm3w8H+jHE35964C8whI/QGcwDYHDxsyhFLRo3gG8rVx4/7Pj+/fatZYRNxOORqV48yOFg76Um/4iAhiIHfql6j9HpqbSWNMpEtoVoQSgLSmKIcSgal4Z6Q1QCS9o8DzSNJp8Fc9OMeb/rz7rDUEqrnGmbJ3sjpOuYWrgSsJnWOhxlTOlHxw5ZwJzPkMQIY4eYUwUMs177M+YazOlwbWlO7+ms6uIkxqDG0jef80l3V8Pk6C7hnl9wqVrh516Gvv8165/U5JMBV14Vlal84xfOcXtHcOVStmmuOfvAzOSGdRbqWj+ye0Q4/4KoFIpz04NBh89ZCLnX29SHDhv1J5OdVRiOwLHZKNVkkF218wkc6EgZGKlL4dz5sQALD03PMppxt42v7wFT+1EPOB3ffmmRTla9suFlQ1Koonmd7GTc8JLsb/yD0unt/3jOUm4HroG4d4iTE7QaJbAnebNDmyQtcfZHGoTbVSQuhxnHEbbszB/b1gLfwUV4vXxwK8jio6MfJUaJ0lCOf5bMgRVCLuJzL2siFDP6vi+Pb4poTZfYXr/rWHDgWjkCp8qxDTRZ9Ggjmg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MWHPR1001MB2365.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(7916004)(366004)(8676002)(5660300002)(316002)(66946007)(6486002)(44832011)(508600001)(38100700002)(6916009)(86362001)(66556008)(66476007)(38350700002)(9686003)(8936002)(26005)(4326008)(52116002)(186003)(33716001)(6512007)(6666004)(83380400001)(2906002)(6506007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?9wn06106roGO+KG3iGT7nCRjl/GC2gSoWp0XoN2WBJsdedv+/yZUYGZCfxSc?=
 =?us-ascii?Q?wUADg1znons0KjQBKPoNKbt828bHufERqjRa5kSPCe6aduHoePGqsNJThBZ2?=
 =?us-ascii?Q?hWEmNEKXYu5jqtE3qlKueBKbQOY28nIUux3Srb0RT5fKJVF/0f3/FL6hQ17z?=
 =?us-ascii?Q?WZrNGGUVPBf8oBhPSGfCw5NEuxPL5jZWNPOEdy1/ilK1Gzs2HshrFcvg0TDL?=
 =?us-ascii?Q?mekcUPiakZ47LPqzfWivmxNxhghkjhlkEOtmCiYACr8uv762m1/WgD5UPjJp?=
 =?us-ascii?Q?IkhSyrQZlQZS7APgPY+Sr5Ypyi/PtRSoJAKr1JvLP8C/RCIxo/++Ut0A8B1n?=
 =?us-ascii?Q?yclk/Y1cy8mlBNOkr1Qk4RaAsTmBVDPFoKyMbxT/OmBsm9I/a3nB71G1jdxD?=
 =?us-ascii?Q?FAEfBavVi8r7iVvOoQD5hoZdeOorGRR/Bo4sXYq+B1KoQ/oNxb3Gc+zoOoyL?=
 =?us-ascii?Q?0N558cVOZquRcztkCA8CDNyvkT36wv1DH+2KhuN1DStjTcQVOqeO4Sw3x00a?=
 =?us-ascii?Q?TXyi5c/HTyWgH59HHSmqpXL2fUDgrpi3GBdFpwLCx5UIIAo43Km6IfhYdHTC?=
 =?us-ascii?Q?Y4L1qZwyGsHkct37IzzGlPGRHugRWnAAQ00yp5F3GQ9pXZjJpo7yNyPq2QiB?=
 =?us-ascii?Q?OXXqD1nAwKheJS5SUdXUIHuzwzucX9lk3wobeTzjJWpgmos7I08NdHwH5gso?=
 =?us-ascii?Q?cmNviguYZmMxZwbVSNWYEypNdGzq4n7Bagy+CErdt2W4WbSrYDqYScI2b1CX?=
 =?us-ascii?Q?ktk1w3nyAd15h/QR4EBOdUH+WRyOsRp9IBAgKx/605C+bruToh2DgpFUfor3?=
 =?us-ascii?Q?aykJ97t3AVcm2pbQA8Yx0M8JSFAMS/OL7AKHWHIhHM1cdUKHLcv7PzkZ6STD?=
 =?us-ascii?Q?5Y1E3fg+ZpZh0WUvFDVbs6PTu71ib2SSwRVKAtCV6lkMwb4tM5hpS4DxyylP?=
 =?us-ascii?Q?pur3DVGBOrATYFRlk63E/6kCY00qrF90vqXg9lA3Qy6mbt/1Q+ItNvvRAMi8?=
 =?us-ascii?Q?TUjI7sg9PIHO8MQ3bWmspn+RiFO82soeOAs2rLEdoo1apiBEG293bafvMABw?=
 =?us-ascii?Q?qvwYtzJXzFA1EtM8K1h3cV6uMT7nIMsfvbx6aGJbdrUXmoqCSQMtxMbHcz64?=
 =?us-ascii?Q?cUVO2YJUqu7FqBV0jf+iROIZSegYenomn62/LaaG7pWNftsD7EJH+Yz2AqfR?=
 =?us-ascii?Q?k5QrIgL5cc8k9SmyPZmtiJM1E1su1PCzCWDF43Ta307tOER6780KKLtO6qEr?=
 =?us-ascii?Q?pFiMlpmLeZoZIRUwAVeo7hAGpO8aJk+pYshcAHfOZPyM2lGCQYsec0zVQi+4?=
 =?us-ascii?Q?lmTh4tcJTQynHUd5e4Mk0TbsNZvKKYDPx0t3b+5cbsXe+FVMg/mloWAz+kh+?=
 =?us-ascii?Q?z6c83OY6VsZvfRYqRV1shnGNLe9bAHYO9JRU3Ia07zXuH1nuwqx3+LJ0bf1K?=
 =?us-ascii?Q?8xgHy/+fQ0T5aby2NWXAp/utOr0cJKSiIRb6dBGZ2l+tN8sGoSV3VChT/RI+?=
 =?us-ascii?Q?v5IZ28Th1XN8RaaaFX8JfHk1sjrQx4sC/2m2JFe/qhyxjaDbyXc8FVcpJ5xk?=
 =?us-ascii?Q?WxFNCUz+a3I3A5nigdQkRpYdnLJdhfW+hghuQIsnyAu0/hxh6/No4pLtxhkF?=
 =?us-ascii?Q?6xededwU9iDuBm94NMrYpFtLv/fULDA6aPw3zFgccWHS7422qYcUTXMBzwMP?=
 =?us-ascii?Q?MLdiqiijQWET/tj+ffJN3c0MRi34mexm3bPQ1YOvWUZDdzx1bPkWPdC00pAa?=
 =?us-ascii?Q?7D3KoQqVNyJd3FLz4iitOL4AjGae9EM=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4dd0f581-d5f2-4e11-5274-08da4ea7fbfe
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jun 2022 08:21:02.1849
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ucEfaiZ4mNhR2O5LxhQ4JxbfBCxf8X3VE9pQeOMWLfRzOFyUTbQI1MMeINPX0S7muZRd25ppYDICNGM3LP4qgHe7HukvOzoZIS7JoNizY9E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR10MB2044
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.517,18.0.874
 definitions=2022-06-15_03:2022-06-13,2022-06-15 signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 spamscore=0 adultscore=0
 mlxlogscore=932 phishscore=0 malwarescore=0 bulkscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2204290000
 definitions=main-2206150030
X-Proofpoint-ORIG-GUID: DZYGmwFBqxC25nv14djPV55U7ULwH3fW
X-Proofpoint-GUID: DZYGmwFBqxC25nv14djPV55U7ULwH3fW
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello Philipp Zabel,

The patch 96f6f62c4656: "media: coda: jpeg: add CODA960 JPEG encoder
support" from Dec 12, 2019, leads to the following Smatch static
checker warning:

	drivers/media/platform/chips-media/coda-jpeg.c:622 coda9_jpeg_gen_enc_huff_tab()
	warn: check that incremented offset 'k' is capped

drivers/media/platform/chips-media/coda-jpeg.c
    583 static int coda9_jpeg_gen_enc_huff_tab(struct coda_ctx *ctx, int tab_num,
    584                                        int *ehufsi, int *ehufco)
    585 {
    586         int i, j, k, lastk, si, code, maxsymbol;
    587         const u8 *bits, *huffval;
    588         struct {
    589                 int size[256];
    590                 int code[256];
    591         } *huff;
    592         static const unsigned char *huff_tabs[4] = {
    593                 luma_dc, luma_ac, chroma_dc, chroma_ac,
    594         };
    595         int ret = -EINVAL;
    596 
    597         huff = kzalloc(sizeof(*huff), GFP_KERNEL);
    598         if (!huff)
    599                 return -ENOMEM;
    600 
    601         bits = huff_tabs[tab_num];
    602         huffval = huff_tabs[tab_num] + 16;
    603 
    604         maxsymbol = tab_num & 1 ? 256 : 16;
    605 
    606         /* Figure C.1 - Generation of table of Huffman code sizes */
    607         k = 0;
    608         for (i = 1; i <= 16; i++) {
    609                 j = bits[i - 1];
    610                 if (k + j > maxsymbol)
    611                         goto out;
    612                 while (j--)
    613                         huff->size[k++] = i;
    614         }
    615         lastk = k;
    616 
    617         /* Figure C.2 - Generation of table of Huffman codes */
    618         k = 0;
    619         code = 0;
    620         si = huff->size[0];
    621         while (k < lastk) {
                       ^^^^^^^^^
Here we know that k is valid.

--> 622                 while (huff->size[k] == si) {
    623                         huff->code[k++] = code;

But this loop iterates through k without checking if k is still valid.
How do we know that the huff->size[k] check won't read beyond the end
of the loop?  Presumably it won't go far beyond the end before it hits
something which is != si.

    624                         code++;
    625                 }
    626                 if (code >= (1 << si))
    627                         goto out;
    628                 code <<= 1;
    629                 si++;
    630         }
    631 
    632         /* Figure C.3 - Ordering procedure for encoding procedure code tables */
    633         for (k = 0; k < lastk; k++) {
    634                 i = huffval[k];
    635                 if (i >= maxsymbol || ehufsi[i])
    636                         goto out;
    637                 ehufco[i] = huff->code[k];
    638                 ehufsi[i] = huff->size[k];
    639         }
    640 
    641         ret = 0;
    642 out:
    643         kfree(huff);
    644         return ret;
    645 }

regards,
dan carpenter
