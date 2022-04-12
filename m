Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B1AD64FCEFD
	for <lists+linux-media@lfdr.de>; Tue, 12 Apr 2022 07:31:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348227AbiDLFd6 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 12 Apr 2022 01:33:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45856 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229668AbiDLFd5 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 12 Apr 2022 01:33:57 -0400
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A0D6534B81
        for <linux-media@vger.kernel.org>; Mon, 11 Apr 2022 22:31:40 -0700 (PDT)
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
        by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 23C3Ep97018439;
        Tue, 12 Apr 2022 05:31:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : content-type : in-reply-to : mime-version;
 s=corp-2021-07-09; bh=3IG5Nd2RgHC7LOIMdMynpa0F6+8GlWlP02IlQwSYcj4=;
 b=lAGFJh+bX99U19xeyv5tdtZY/S1hZwqjb/qHQrAezypwp5yf5Fv2N0MQG1HjreJm584h
 yAlfzJcdn9p9ERvN+plxFuOAve3dlu8iti7W1AENmkOQv4NIm3otqmUevjmtKZPqh4Sv
 UPX6uF6peWzMYu2kCcLeRHQHDZwNCDIl3+3Nc3KbVhEe0dryv6IyHxnaV8mh4ew5UtK+
 ToiZ++s1Uwd4f/AyCtYur5YVxL3A13uJeZrL0N7cb1vGvnXXYLFbyQCk1SI9KLmRJo7q
 f5AF+Zvznq4L4wlFJ8tcxdHuLYlBk9n6okZtNc7k7KXw32ZH5doXQY0Ex+oQ4gYZa15m iQ== 
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
        by mx0b-00069f02.pphosted.com with ESMTP id 3fb0r1dn86-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 12 Apr 2022 05:31:28 +0000
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
        by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.16.1.2/8.16.1.2) with SMTP id 23C5QEps015523;
        Tue, 12 Apr 2022 05:31:28 GMT
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12lp2168.outbound.protection.outlook.com [104.47.55.168])
        by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com with ESMTP id 3fcg9h0enm-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 12 Apr 2022 05:31:28 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GOICbUn1RWRNqgll25CCDbaH66Y98Kw2f52oFuAkUBLKiUlnhVX6WrHJUrz7z7M3Xv6tcx4joRmIXLnqxHU1MQvbWVk86piyu9HCFHKFM1msvgzyUFaGievCevfVgeRaLxCDgB/opvySAScRbrSAZI1Fcio0n+yvs7TlGG4gyHfWT14L+MYMN78Fk4i3Zfa4LhRORvtwklDWoax7P8GeS3r8BWOReA2RqLG+V88zWiJM8ZhIgeaB9HT/JFOw4RTGMyz3HUhsSXMoPjph5o+WpzAll2w36JegHoBIG6AReVs7OmQjEqg21LA5O9BHV3lF7nrRB2fv4wqarOzoL62MDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3IG5Nd2RgHC7LOIMdMynpa0F6+8GlWlP02IlQwSYcj4=;
 b=TeOXkO16Hk2GOvpBc7MVDJsWPZiFkhOl8m7HAgSFvIMdxWP0jqT+ZqnkHQjuckWbiaVudYptnopw1usMB7AQ4DnCSmZ3OXivQp3Cy6b2fliysOcuRKb64MNRdA+iaQi0x16AtP6+DC7L4FM1rQlFkVxFc9lnECx80P2t3z29aLEcNAp8qsHO+cqT+l7v0V3aO5OHCXxxemKXGgCM51ohpAB1GfpoiB3ivml97R9CUAJO2Qr8xOL8g+gTYHQuDUfLaQU7qPm/dlRhq51lnbyWiUY8zFIvFUhELPQC9g17o/F1pMaYXzYydmWwK1KtKev+PRZkTwOWcZnWoHMJp940uA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3IG5Nd2RgHC7LOIMdMynpa0F6+8GlWlP02IlQwSYcj4=;
 b=ej4+LodsWnOc92l/f2lLHpPX7kIbpih3AluasbIW0KAWIrn6ubqQxvCuiF+Z5JpqakRs0ln+sNF/UGwrgbe9gBt74NEUxggN/uezTA/6hhhujjMtGbvCMAMRCFefG8X+OomU/Wu9gk13mQBevYhsbrsj7hFhSrmdOa6JPFyDhsI=
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by DM6PR10MB3292.namprd10.prod.outlook.com
 (2603:10b6:5:1a3::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5144.29; Tue, 12 Apr
 2022 05:31:25 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::b5d5:7b39:ca2d:1b87]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::b5d5:7b39:ca2d:1b87%5]) with mapi id 15.20.5144.022; Tue, 12 Apr 2022
 05:31:25 +0000
Date:   Tue, 12 Apr 2022 08:31:03 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     kbuild@lists.01.org, Philipp Zabel <p.zabel@pengutronix.de>,
        linux-media@vger.kernel.org
Cc:     lkp@intel.com, kbuild-all@lists.01.org,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>
Subject: [kbuild] Re: [PATCH] media: video-mux: Use dev_err_probe()
Message-ID: <202204120703.9LLj1dO9-lkp@intel.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220411135314.1012346-1-p.zabel@pengutronix.de>
Message-ID-Hash: LKNHK6PDVEBGCQWXGKTSGU72LJQQHTME
User-Agent: Mutt/1.9.4 (2018-02-28)
X-ClientProxiedBy: JNXP275CA0036.ZAFP275.PROD.OUTLOOK.COM (2603:1086:0:18::24)
 To MWHPR1001MB2365.namprd10.prod.outlook.com (2603:10b6:301:2d::28)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7d01c97e-6daa-44d4-c29c-08da1c45afbc
X-MS-TrafficTypeDiagnostic: DM6PR10MB3292:EE_
X-Microsoft-Antispam-PRVS: <DM6PR10MB3292D36A602BCAEA0D8AFC158EED9@DM6PR10MB3292.namprd10.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 5tI1PqTQMBhbuXPlRMg/hofcfa843W/WGe37VtDuBeSYzNHxbVQ4OcoamACHwCTDeuiq5OdbF0nne36FOKyBtRjP4EJ4/cCrOu90qKx0c+AUDqCFhi/Dbbv4XGED/ixR2d+DNuDoxrLCg0ahbLoKYEM44UqDGC//am/jN+uyon78kNQbb+vp6nq1Lo0ClD/RqJSM1ef225NKSuBL8CO/S9KrU7I2Q+ZWTbqikIWLs2HYagPDdIMxEct2dGo1dIH+C06VwsaohGaTGxs+XdwIFjOkzs3qP665Rp/9jpdrmypUg6dOAVNuJsNNA32FVnr4lckAcTbkJzR50otVtdODEuUmsFAtf/ImC4fbZCVOWccMf1eWcSp58mT3vwuGzqwmAEfJX58DKhK5XLjTWi5Xsm2FKYGhF5PAuIhgWZ06AUrZw0xoobhEazG5TUtDuuJMMZogP0MU7C8uC5s+ER73pcLBsj6vK7mh1JeeaCrD/eJvi63CtBpAfRkWPrPZ2jjBel7lUq9DNKBEez53iC9XxYL2BcHMbDfTCUtpH9QH7AgCM7/doD5YLyNOPKvujn0e+Nhoe8GbS+BbDlwfzmyuVwYYDw83VLHd6njtGgQ+whTcXX22UOIVCi0IyuoFY9IEzURx46z3nNPHkEeSVklWa7WtsG2zp7/8ml1ZXjE/oUFrTHVq4lmHnnk3A30uIRNCyQEvTSoYtanoFOBIumzdtv2CvtI9ASLRScci6Rbb3Uev/mcVWTH86k0IU0i/UrRgSYqwjJRtzjjRhGDidZa1ac2Z+laDZeGYmceVHY2erbzBg53Fb5tUVK3E0tard6eLu+x0wF9ro7r+i1slH8zWtw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MWHPR1001MB2365.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(6486002)(8936002)(4326008)(186003)(26005)(5660300002)(2906002)(36756003)(966005)(316002)(44832011)(83380400001)(508600001)(66946007)(86362001)(54906003)(66556008)(66476007)(1076003)(9686003)(6506007)(6512007)(38350700002)(6666004)(52116002)(38100700002)(8676002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?JkQmI7QmXG0MxLpYwihHnM4Ps0ZL3T1/PaKAJfnwfyjJBCBN/dv72gZDye7G?=
 =?us-ascii?Q?ByI2X1//LvzSmn8Yy9gpgeexONHtsLF0t2YX+9sN0ImdNasJkjIw+lISfTs4?=
 =?us-ascii?Q?PFhXPLq/4SiAp2xG0IpqLvPwB64DMBGb+a2NeGWObJnXJRgKEMbvB3B8ev2g?=
 =?us-ascii?Q?5f2N5kmzWugZfTPXIhb99KgSEwG5pcOqiMTNTWq8n6VQwuidSeF4STSouDro?=
 =?us-ascii?Q?Zjcqk7l9EdT8BVxTkGEehEWf7WsWURQQtwKtc/lxQ64Pl7mKe4xPkzBu4Wg8?=
 =?us-ascii?Q?//LTWCzIKJ2yKpQrrsN8qyhODsrVyNfoRmYA8pWEKmwlGl0UvJr3wgdaFaGZ?=
 =?us-ascii?Q?m3sNMCj8OTLUw/DHzSWVu4o5sU2TOr7JOjYVwvU9CFmcR9YSg/PviKaISjQy?=
 =?us-ascii?Q?/dDPv9VhuFkJipkPMvaw2xjkuyWXr+dTZHqe493ubnCGcGzBj0BVmqoC+9u8?=
 =?us-ascii?Q?lDdhr2lVCYa8402+ge8ljJtFpOKK/Ub4xJhRfr7rv6tI+Y7e7Z89p3MvahMb?=
 =?us-ascii?Q?TFQB/+KHy0j7lpV8sNY6el4mxgGSq2dNPg2z72HZVwOAY9E8Jr175bPOve+6?=
 =?us-ascii?Q?Vqle/w6b+mafmN4gccpBI73GUPIe5eo2zJItD++rVgDHM3tdNysFjDKhBzWF?=
 =?us-ascii?Q?MQHc5vISEEWNfZ/J0Q0QN5iB6eTHjVJXxt5oFV7OJWvEI2JhC7UnWk02diTY?=
 =?us-ascii?Q?eynKhD9jWjDRepg+DUFGWny54Ro6Lgu9Up/hW04C7uquiACC8AKcDcGuykft?=
 =?us-ascii?Q?LnQLpWfruMmKBQUEX2sOt7EjlhR/if9O7U80KAFKV+ObXLN8lsaxbWcXzPvs?=
 =?us-ascii?Q?SocJyU0xVSxEnK2KQ4m9ihp46DvEUUdoH2uAMlLOL3goFt/dswMA0NlRFKi3?=
 =?us-ascii?Q?tfVXy7Vfpr5bDCSjSpvbMh9UkjXwEBbx1eEqjob+izI9Vi9VxOn/t7vfWmWs?=
 =?us-ascii?Q?/lRo5+B6UqNwBHoCID6zCeiwViyQdDkVjRTcvoMQ05ePDjJd0CxNS/PDyNHv?=
 =?us-ascii?Q?sDY80+4zpCKq8H0yF5/heShO9XQeoColliO6a3VTEzj3IMcVFe3EIDJaVo2/?=
 =?us-ascii?Q?BHAVYZGJX/HGnmbZ59RZhZVhWvEE0R/iwO/3sXEsrV+ZzaIhtm/M93HFDP2u?=
 =?us-ascii?Q?YrFScZlgkAcl58aqq7WaDzKSZpkYyWqelMV3dVjBt/ksEnNH/800xaJwItw1?=
 =?us-ascii?Q?Jyf3iXygEyS0Tes96OMrfQprwIUClOOsUSnUweLCyysOdaHYTjDHO9HzCvvk?=
 =?us-ascii?Q?WrNWgyWoFCIRUHjzxNS2bG2351iMps/UWixkrM0ZublU+98kq60p+MQAMxlz?=
 =?us-ascii?Q?3A+zYeKgwsbiPVbOy9njY/lCX0Pf8E7MRUXb16hf2M55l61LFF5+4SEZPBNI?=
 =?us-ascii?Q?XNIHZR4w1YL9iKdN5fQBlcBkcBlHSSUJFdkbJq7gUzDfUCHpuRTzlkQHzq6e?=
 =?us-ascii?Q?jL6PC1Opuq0pfnekJAHhq9n0owOjoTxYm5prjmxz5riMZMLXw80XFl33pKFN?=
 =?us-ascii?Q?HX9xLKa6mTmipalOV1j2p5alFls3w2/aWLP38ohYfRFXYABq96aqARLcdiNM?=
 =?us-ascii?Q?r+VsfCQs1py+wifDjcPNTUmuZ/5uGIjYq/DDrBX06RpBldHnEoNNxspiAeSl?=
 =?us-ascii?Q?wW7BVakOQv57q9OXD2yDjrSV5BiTWOjqRaaJkaKp8R6/6zmnrCe+y/YEUyUG?=
 =?us-ascii?Q?sDS7PozuDi78ZXiYX4FU2ORC1BoO9xEgRBvjBwGzg0jJ8XB/wK5tedX1g51O?=
 =?us-ascii?Q?NVTekNT0w1fXVMue7ryzih72VmnA6uU=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7d01c97e-6daa-44d4-c29c-08da1c45afbc
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Apr 2022 05:31:25.5394
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 62T5sxiqxjqxRXYajPP8W4yOpmg4oVohEYu+XxCtxipQ2lr9E5DzW1EcoKsIgCPJflUX2wRL3buHKhwC3rmXBeGKzNmcG6HEZZnnE7Llmck=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR10MB3292
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.425,18.0.858
 definitions=2022-04-12_01:2022-04-11,2022-04-12 signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 mlxlogscore=999
 spamscore=0 suspectscore=0 malwarescore=0 adultscore=0 bulkscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2204120025
X-Proofpoint-GUID: Tm9oMu1MnGzxmXtsZu50mvg_YedFA0aw
X-Proofpoint-ORIG-GUID: Tm9oMu1MnGzxmXtsZu50mvg_YedFA0aw
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Philipp,

url:    https://github.com/intel-lab-lkp/linux/commits/Philipp-Zabel/media-video-mux-Use-dev_err_probe/20220411-215408 
base:   git://linuxtv.org/media_tree.git master
config: x86_64-randconfig-m001-20220411 (https://download.01.org/0day-ci/archive/20220412/202204120703.9LLj1dO9-lkp@intel.com/config )
compiler: gcc-11 (Debian 11.2.0-19) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
drivers/media/platform/video-mux.c:444 video_mux_probe() error: uninitialized symbol 'ret'.

vim +/ret +444 drivers/media/platform/video-mux.c

68803ad4522f5d Philipp Zabel    2017-06-07  405  static int video_mux_probe(struct platform_device *pdev)
68803ad4522f5d Philipp Zabel    2017-06-07  406  {
68803ad4522f5d Philipp Zabel    2017-06-07  407  	struct device_node *np = pdev->dev.of_node;
68803ad4522f5d Philipp Zabel    2017-06-07  408  	struct device *dev = &pdev->dev;
68803ad4522f5d Philipp Zabel    2017-06-07  409  	struct device_node *ep;
68803ad4522f5d Philipp Zabel    2017-06-07  410  	struct video_mux *vmux;
68803ad4522f5d Philipp Zabel    2017-06-07  411  	unsigned int num_pads = 0;
efe1958ec41bab Philipp Zabel    2018-05-24  412  	unsigned int i;
68803ad4522f5d Philipp Zabel    2017-06-07  413  	int ret;
68803ad4522f5d Philipp Zabel    2017-06-07  414  
68803ad4522f5d Philipp Zabel    2017-06-07  415  	vmux = devm_kzalloc(dev, sizeof(*vmux), GFP_KERNEL);
68803ad4522f5d Philipp Zabel    2017-06-07  416  	if (!vmux)
68803ad4522f5d Philipp Zabel    2017-06-07  417  		return -ENOMEM;
68803ad4522f5d Philipp Zabel    2017-06-07  418  
68803ad4522f5d Philipp Zabel    2017-06-07  419  	platform_set_drvdata(pdev, vmux);
68803ad4522f5d Philipp Zabel    2017-06-07  420  
68803ad4522f5d Philipp Zabel    2017-06-07  421  	v4l2_subdev_init(&vmux->subdev, &video_mux_subdev_ops);
f764e6d6803915 Rob Herring      2018-08-27  422  	snprintf(vmux->subdev.name, sizeof(vmux->subdev.name), "%pOFn", np);
68803ad4522f5d Philipp Zabel    2017-06-07  423  	vmux->subdev.flags |= V4L2_SUBDEV_FL_HAS_DEVNODE;
68803ad4522f5d Philipp Zabel    2017-06-07  424  	vmux->subdev.dev = dev;
68803ad4522f5d Philipp Zabel    2017-06-07  425  
68803ad4522f5d Philipp Zabel    2017-06-07  426  	/*
68803ad4522f5d Philipp Zabel    2017-06-07  427  	 * The largest numbered port is the output port. It determines
68803ad4522f5d Philipp Zabel    2017-06-07  428  	 * total number of pads.
68803ad4522f5d Philipp Zabel    2017-06-07  429  	 */
68803ad4522f5d Philipp Zabel    2017-06-07  430  	for_each_endpoint_of_node(np, ep) {
68803ad4522f5d Philipp Zabel    2017-06-07  431  		struct of_endpoint endpoint;
68803ad4522f5d Philipp Zabel    2017-06-07  432  
68803ad4522f5d Philipp Zabel    2017-06-07  433  		of_graph_parse_endpoint(ep, &endpoint);
68803ad4522f5d Philipp Zabel    2017-06-07  434  		num_pads = max(num_pads, endpoint.port + 1);
68803ad4522f5d Philipp Zabel    2017-06-07  435  	}
68803ad4522f5d Philipp Zabel    2017-06-07  436  
68803ad4522f5d Philipp Zabel    2017-06-07  437  	if (num_pads < 2) {
68803ad4522f5d Philipp Zabel    2017-06-07  438  		dev_err(dev, "Not enough ports %d\n", num_pads);
68803ad4522f5d Philipp Zabel    2017-06-07  439  		return -EINVAL;
68803ad4522f5d Philipp Zabel    2017-06-07  440  	}
68803ad4522f5d Philipp Zabel    2017-06-07  441  
435945e08551ef Philipp Zabel    2017-07-18  442  	vmux->mux = devm_mux_control_get(dev, NULL);
475ef968829498 Philipp Zabel    2022-04-11  443  	if (IS_ERR(vmux->mux))
475ef968829498 Philipp Zabel    2022-04-11 @444  		return dev_err_probe(dev, ret, "Failed to get mux\n");
                                                                                          ^^^
This should be PTR_ERR(vmux->mux) instead of ret.

68803ad4522f5d Philipp Zabel    2017-06-07  445  
68803ad4522f5d Philipp Zabel    2017-06-07  446  	mutex_init(&vmux->lock);
68803ad4522f5d Philipp Zabel    2017-06-07  447  	vmux->active = -1;
68803ad4522f5d Philipp Zabel    2017-06-07  448  	vmux->pads = devm_kcalloc(dev, num_pads, sizeof(*vmux->pads),
68803ad4522f5d Philipp Zabel    2017-06-07  449  				  GFP_KERNEL);
aeb0d0f581e207 Kangjie Lu       2019-03-09  450  	if (!vmux->pads)
aeb0d0f581e207 Kangjie Lu       2019-03-09  451  		return -ENOMEM;
aeb0d0f581e207 Kangjie Lu       2019-03-09  452  
68803ad4522f5d Philipp Zabel    2017-06-07  453  	vmux->format_mbus = devm_kcalloc(dev, num_pads,
68803ad4522f5d Philipp Zabel    2017-06-07  454  					 sizeof(*vmux->format_mbus),
68803ad4522f5d Philipp Zabel    2017-06-07  455  					 GFP_KERNEL);
aeb0d0f581e207 Kangjie Lu       2019-03-09  456  	if (!vmux->format_mbus)
aeb0d0f581e207 Kangjie Lu       2019-03-09  457  		return -ENOMEM;
68803ad4522f5d Philipp Zabel    2017-06-07  458  
efe1958ec41bab Philipp Zabel    2018-05-24  459  	for (i = 0; i < num_pads; i++) {
efe1958ec41bab Philipp Zabel    2018-05-24  460  		vmux->pads[i].flags = (i < num_pads - 1) ? MEDIA_PAD_FL_SINK
efe1958ec41bab Philipp Zabel    2018-05-24  461  							 : MEDIA_PAD_FL_SOURCE;
efe1958ec41bab Philipp Zabel    2018-05-24  462  		vmux->format_mbus[i] = video_mux_format_mbus_default;
efe1958ec41bab Philipp Zabel    2018-05-24  463  	}
68803ad4522f5d Philipp Zabel    2017-06-07  464  
68803ad4522f5d Philipp Zabel    2017-06-07  465  	vmux->subdev.entity.function = MEDIA_ENT_F_VID_MUX;
68803ad4522f5d Philipp Zabel    2017-06-07  466  	ret = media_entity_pads_init(&vmux->subdev.entity, num_pads,
68803ad4522f5d Philipp Zabel    2017-06-07  467  				     vmux->pads);
68803ad4522f5d Philipp Zabel    2017-06-07  468  	if (ret < 0)
68803ad4522f5d Philipp Zabel    2017-06-07  469  		return ret;
68803ad4522f5d Philipp Zabel    2017-06-07  470  
68803ad4522f5d Philipp Zabel    2017-06-07  471  	vmux->subdev.entity.ops = &video_mux_ops;
68803ad4522f5d Philipp Zabel    2017-06-07  472  
f4d7a681b82665 Steve Longerbeam 2020-05-01  473  	ret = video_mux_async_register(vmux, num_pads - 1);
f4d7a681b82665 Steve Longerbeam 2020-05-01  474  	if (ret) {
3c8c153914812a Sakari Ailus     2021-03-05  475  		v4l2_async_nf_unregister(&vmux->notifier);
3c8c153914812a Sakari Ailus     2021-03-05  476  		v4l2_async_nf_cleanup(&vmux->notifier);
f4d7a681b82665 Steve Longerbeam 2020-05-01  477  	}
f4d7a681b82665 Steve Longerbeam 2020-05-01  478  
f4d7a681b82665 Steve Longerbeam 2020-05-01  479  	return ret;
68803ad4522f5d Philipp Zabel    2017-06-07  480  }

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp 
_______________________________________________
kbuild mailing list -- kbuild@lists.01.org
To unsubscribe send an email to kbuild-leave@lists.01.org

