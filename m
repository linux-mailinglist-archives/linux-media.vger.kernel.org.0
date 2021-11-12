Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C95E544E495
	for <lists+linux-media@lfdr.de>; Fri, 12 Nov 2021 11:30:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234886AbhKLKdp (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 12 Nov 2021 05:33:45 -0500
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:34844 "EHLO
        mx0b-00069f02.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S234675AbhKLKdp (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 12 Nov 2021 05:33:45 -0500
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
        by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1AC8xTbe017907;
        Fri, 12 Nov 2021 10:30:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : content-type : in-reply-to :
 mime-version; s=corp-2021-07-09;
 bh=hsnzsiX8ynjCHzjomUJeDrHT1W29hDBOex9CXGuA5cw=;
 b=ZziZQ0kbEfD+BPmAB5imAAF0qlVh4MBeuMvO9+NpZfllMqs5DRTDR6t6UexN2dy6byrQ
 Y+G8aK0FSD3tDgWuE35Fai3mJLxnqD5RPigMUiBVrmK2H8kmZvFBRVD5yXhUS+4t7dk3
 HqdGWDw5oskubYQF2gE+Fm9F4+F1wn1yUvkKAyvqoiWZYI0XqWw2BGU58R5BG1NUoODk
 PV4VhFO9TQyN0DY7/CKX1G7M3z/S5cyfIBLoyDLKcgKHAIPqvCVPhWCmYTJPkiIHFrqL
 sbZPXyAR0/RlS0/CzP4WqOIThpyCMG2Qe0cEvR/tGAou4/pByppH5pFyLlkEiCT45lAe 3A== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
        by mx0b-00069f02.pphosted.com with ESMTP id 3c87vxx002-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Fri, 12 Nov 2021 10:30:38 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
        by userp3030.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 1ACAFtj9116441;
        Fri, 12 Nov 2021 10:30:36 GMT
Received: from nam10-bn7-obe.outbound.protection.outlook.com (mail-bn7nam10lp2107.outbound.protection.outlook.com [104.47.70.107])
        by userp3030.oracle.com with ESMTP id 3c842ey399-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Fri, 12 Nov 2021 10:30:36 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kJ8LoQnXX0TFFg6SlpSs4O/5P+kKLBuGqJLI8ZSvf+CvzAFl4lgpwKb1UsNTIOsW8aeTejRtntq7kzFzkJdfAlOghXKePSnjONO2spqZbSlJPKgUfoK8pytEZ64ShU5eLoHFphHD8u5m68mJ/Hc1wwllwGc05d6mkGSv3wcxY7HAAdcxY5z2vLQDpcjlq0IsglBD/sGlVlJqxRtMLOEtGKtYAl26UFHo7Qd/P4wBVekaYwoJZ8/U70ExiSb6EJ0EN4hu4FE2br3vLYA3ftYhfAX9zfHaJopt7JqJRUXH2ZQ1MTyLnHPY1feXi31yEdbfF+tPACfVwjpBIUK+DI5yeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hsnzsiX8ynjCHzjomUJeDrHT1W29hDBOex9CXGuA5cw=;
 b=ekau0sg9V2cWPFpZHbi8ZOQ1W0x/GKAJeTFtaIV48vxp+X65rl5MHoNmN9P5p3xVRF78jJ2OJF5Yvhy5ARFU5H7ayf4FOc3oJpMMTJ35eLSyn2qiwDvqreAkfJ1Tk3733DDWJQUy8K0wZAjY89S5ezmnuaed/afc6fo2179XgwDljJgwqFOF5qED9WOWtKBl/83kPdPCmYdkzPECpwlG3TRTrYC7CKPeLyKmb/Wf6PHGFET/7aRFFbB3ZHN5i0xDjQQiZwBxSLp92pIVkIuFiOJVjwy3/Q6W42z3EdIYIBAFOPX2tZESbv1iC5JYftweur3td2MsYzGT1GvoK00yKw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hsnzsiX8ynjCHzjomUJeDrHT1W29hDBOex9CXGuA5cw=;
 b=VpsreabkIk35/wY/I8++ZTlilFtagrxqdia/VevEOKs/UpDZnHbbFwETUbIccbT+MDraxoqaC6zMC9afDfwlzBBADfZA0h73uPojl2eWOZWeAq9ZXLts1MolJC2oaViVW1KkiJlZ/+5oaZE6YQQXSTypNwnXlggKnbCW+BbeODc=
Authentication-Results: collabora.com; dkim=none (message not signed)
 header.d=none;collabora.com; dmarc=none action=none header.from=oracle.com;
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by MWHPR10MB1614.namprd10.prod.outlook.com
 (2603:10b6:301:8::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4669.13; Fri, 12 Nov
 2021 10:30:33 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::d409:11b5:5eb2:6be9]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::d409:11b5:5eb2:6be9%5]) with mapi id 15.20.4690.016; Fri, 12 Nov 2021
 10:30:33 +0000
Date:   Fri, 12 Nov 2021 13:30:07 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
Cc:     linux-media@vger.kernel.org,
        Robert Beckett <bob.beckett@collabora.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "open list:STAGING SUBSYSTEM" <linux-staging@lists.linux.dev>,
        open list <linux-kernel@vger.kernel.org>,
        laurent.pinchart@ideasonboard.com, hverkuil@xs4all.nl,
        kernel@collabora.com, dafna3@gmail.com,
        kiril.bicevski@collabora.com,
        Nas Chung <nas.chung@chipsnmedia.com>,
        lafley.kim@chipsnmedia.com, scott.woo@chipsnmedia.com,
        olivier.crete@collabora.com, rdunlap@infradead.org
Subject: Re: [PATCH v3 2/6] staging: media: wave5: Add the vdi layer
Message-ID: <20211112103007.GB27562@kadam>
References: <20211110120910.12411-1-dafna.hirschfeld@collabora.com>
 <20211110120910.12411-3-dafna.hirschfeld@collabora.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211110120910.12411-3-dafna.hirschfeld@collabora.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-ClientProxiedBy: JNAP275CA0013.ZAFP275.PROD.OUTLOOK.COM (2603:1086:0:4c::18)
 To MWHPR1001MB2365.namprd10.prod.outlook.com (2603:10b6:301:2d::28)
MIME-Version: 1.0
Received: from kadam (102.222.70.114) by JNAP275CA0013.ZAFP275.PROD.OUTLOOK.COM (2603:1086:0:4c::18) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4669.11 via Frontend Transport; Fri, 12 Nov 2021 10:30:23 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d6ad4331-46e3-4ba4-224b-08d9a5c77553
X-MS-TrafficTypeDiagnostic: MWHPR10MB1614:
X-Microsoft-Antispam-PRVS: <MWHPR10MB1614D2FDB2494598493216588E959@MWHPR10MB1614.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2276;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: lJpVS7sWX29GseVAtXUnHgepvnV0AcaJ5Q5Y6mQwsS23HKedOQrbbcPvfoMOGvpH9PJ6ZOXjUDB4CUy0kRUQMPMvf1f/0L3Dc8S8gczIPcVbPqg7AYRLnPG2CWMNBOkJqn0vMpt9WDcBOC/cg61SsrhWDPrQPoBuQJLasU2qztD3K0+DiP1fAHk42U1XmP2XC0TOohbRmUj457jfLJUJBMMRPs57QrQok3MmfXAJi0VcpHCSAtZncfr4ghutQAfuuulSaSWP9GIxqLJlyoi1ljpWjl5emZLN90/gVMNOe5cp+dCl0k2FS1QbOeHIXzytP6BVZ3mzHGqBofsD8+TocgRO9zb9IvQbkD3gY1SGNgfBN5N2zw8pyYvba+7QTi/NXljKgMsfwI4+hQUq+dpWOF8hPPf4nZEJ7U0pjmHF+qAaQVMoIIhMV1643zXqDHykYBA7Aa+69MZ4OHB/7NlY7tqewOf3QB87Seroe5Ffa1EGnK3l/js4R2zOid7Hxt+EHYolYXQFpq0Fy0A0DBXvLBEH7+Bawqz2f9X13pk4DQYzlCnKQtucuBDG0HRCDCOpmV0xaCuJeliwy2JZdxz/Rey/VLPnKA1laalQMqXvI9bHjmlSviI2rn2lpTy33kUAQNfmy47HjyFwjgNrSrkVUJL4M3n9iYmTX17lSp/FFVMhzRdOBevwDFOoz9YWPscQHvR27JAfD6y51K4AG2I9lQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MWHPR1001MB2365.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(186003)(38100700002)(956004)(38350700002)(54906003)(2906002)(9576002)(66556008)(9686003)(316002)(26005)(8676002)(86362001)(8936002)(66946007)(66476007)(4326008)(6496006)(33656002)(1076003)(508600001)(83380400001)(33716001)(55016002)(6666004)(7416002)(44832011)(52116002)(5660300002)(6916009);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?j+rt4aypoFagStsdH1IJL9MKNCJmce9HL0cdWQ0/TCNA1Tkrob6HbHo1MeuV?=
 =?us-ascii?Q?T0D7eNdEbxwdJ2Ij+bEM9pM0mmUTqbpgpLhdCZFI1MpjfavpiCQCxWciC7qA?=
 =?us-ascii?Q?X28zztsZ7ftIpy++19bODKH9/nqastDaXhX6GpotEylQuxWI3ZJe9j4bTyII?=
 =?us-ascii?Q?EzZ+p5flkSPVpHnubteFv65GKGKKffrMfUyOKswRySdrigF4/XGS/igqLroV?=
 =?us-ascii?Q?oxHChwmCILBYUqwOQBZWAEO2OOtuS26FlUJ6LLTpa+GXqhWzKPtB7EjOIm0z?=
 =?us-ascii?Q?j9FlF7HKnGDP2z4Db2pXuw0uk1Knytk26RxvJbCkdl+gWLRL2xwsVYaQK232?=
 =?us-ascii?Q?Cu4KdClo4G1Q2MtPo6wsuIvHkzY0qFYUtjD6EpMZgKjUoaECXcxqbxN4sHDL?=
 =?us-ascii?Q?MsdGgkyuDoMzcLmEKwddAZMBhT8v6U8ERpJNydokwKoQQh2AlkjxEQLdLwkS?=
 =?us-ascii?Q?kcKPycIJ6t8hB+g5dzhIjzLsSah1ksTGTgOgI8dp0ULTlYLtWeKpUsG8gIlA?=
 =?us-ascii?Q?5O4I6tbwTg4eFoOcvVXeW0tqWddHv3FijQUvuAj5VJUP14rYrh31CurfBarF?=
 =?us-ascii?Q?7FNcbbxLXwWMT+IwTiWxOmR4BlydRNtsOYh+JUqZGTQX6Ei08H8H8PuRVIFC?=
 =?us-ascii?Q?VZ8fnfoM2YCPBVCLwZSB7oCfO41jywWH8NXmbLFSEO+m2EKpb/zKNS0tbJD1?=
 =?us-ascii?Q?QnE/klNWS9t88AJt6hv6mR7I6NUC9PXr/8i/HBPo88E3xwWqXzNx+iqSRAkF?=
 =?us-ascii?Q?YgKI8IRQdRi3jpc22/hVXuv/a3XPhk4Rll9cgYdZ+BnzMjZY45pnyhlrOPot?=
 =?us-ascii?Q?dWL7DdJFlD1+DMFxrxic/9XGdi3AgNkcAukxM7qr92gSOEBUcYBp9KahSycA?=
 =?us-ascii?Q?lSo6lm7KUN3Eg8hgEwgcHnV/CkCmewNEt2u2tDKij7TRC2bj9CAr4YGTeVUK?=
 =?us-ascii?Q?8mPNBQYPGxNHWvf0x0KJkt0sS9duKQ8yYaVdcK/FQKy6n59hMIIBZU832qDq?=
 =?us-ascii?Q?UA7jBrYZX4NGB+rNY5c/p1COltSQSNrIkssw42lwGAOW4AsXBJdgBxGT321i?=
 =?us-ascii?Q?bZX3TWVbmCf4RwiKTp45qjYZQ2DqqZNlTbIDqzDmU0ZZkWrZtWtz4M7WV4zw?=
 =?us-ascii?Q?oBXg2dBfUr4HzBmm14LgdaqxR5XtkkjhuScUgtvKEjca5fxAOWDLMbcYiyHL?=
 =?us-ascii?Q?Zq/A1jUh4pLzGSLLyDMJmG64/l5m1HZ5GQ3PtKM6k5v2skqDYVoqbkXg2Ffc?=
 =?us-ascii?Q?grRRIDCcZ/VRQpaNEY83izY8KEdbN0tVLi7H/tmNDV8fgCZyh5druwn0Hjbe?=
 =?us-ascii?Q?esHk1JUG2izP8zDCpbCrNJAe/noSIfdxipXgAglVdvA54+PmPbzhKWxK3I2C?=
 =?us-ascii?Q?7CJNI7oC8hZ2v/eE4htXpJRpKe9WyYBM73vAXxPw31QtbMegDCTUXaWzgq87?=
 =?us-ascii?Q?6aD0WfRrRRLGpYF8YI8OP0qbnxdQ2720b7GU9MfbLAXRmdQRle2ADHEMIA5i?=
 =?us-ascii?Q?HHN378oKmRyAhHkqw5P0g8csR6C52FYbrk6XznihCQmjIUw+XWH+vyTqb/nO?=
 =?us-ascii?Q?9L39B8NRI36Tt2jf70ARsxHiYJugYCwOv4YktgoPeDydykFabbuvbGBR/zdB?=
 =?us-ascii?Q?JjGU10n/g9eWFWm+aIJA+4fLyluoZTE74LMnRlbmMV2w/1/ec55GNnkWPHmi?=
 =?us-ascii?Q?yUmcdIF1tUOW5oRhdsquaPjlh2o=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d6ad4331-46e3-4ba4-224b-08d9a5c77553
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Nov 2021 10:30:33.8421
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PEyv6zS7udTSO/wsq093mjbPFFeJwTrSI2estfn9dM/pIhDZu9gQNrZQR+m0CuYNX6mrwT1fKM4fIB6aDQrXicmBE9PZA/1LpVr1umlu60U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR10MB1614
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10165 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 malwarescore=0 spamscore=0
 suspectscore=0 adultscore=0 bulkscore=0 mlxlogscore=924 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2110150000
 definitions=main-2111120058
X-Proofpoint-ORIG-GUID: lTEnE3Dgk9GU6PF9ozcqjvDJCKtb7wNW
X-Proofpoint-GUID: lTEnE3Dgk9GU6PF9ozcqjvDJCKtb7wNW
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


Why are normal kernel endianness/__swab32 routines not sufficient?

On Wed, Nov 10, 2021 at 02:09:06PM +0200, Dafna Hirschfeld wrote:
> Add the vdi directory of the wave5 codec driver.
> The vdi.h header defines common helper functions
> such as writing/reading register and handling endianness.
> 
> Signed-off-by: Robert Beckett <bob.beckett@collabora.com>
> Signed-off-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
> ---
>  drivers/staging/media/wave5/vdi.c | 260 ++++++++++++++++++++++++++++++
>  drivers/staging/media/wave5/vdi.h |  76 +++++++++
>  2 files changed, 336 insertions(+)
>  create mode 100644 drivers/staging/media/wave5/vdi.c
>  create mode 100644 drivers/staging/media/wave5/vdi.h
> 
> diff --git a/drivers/staging/media/wave5/vdi.c b/drivers/staging/media/wave5/vdi.c
> new file mode 100644
> index 000000000000..6049ef76c948
> --- /dev/null
> +++ b/drivers/staging/media/wave5/vdi.c
> @@ -0,0 +1,260 @@
> +// SPDX-License-Identifier: (GPL-2.0 OR BSD-3-Clause)
> +/*
> + * Wave5 series multi-standard codec IP - low level access functions
> + *
> + * Copyright (C) 2021 CHIPS&MEDIA INC
> + */
> +#include <linux/bug.h>
> +#include "vdi.h"
> +#include "vpu.h"
> +#include "wave5_regdefine.h"
> +#include <linux/delay.h>
> +#define VDI_SRAM_BASE_ADDR 0x00
> +
> +#define VDI_SYSTEM_ENDIAN VDI_LITTLE_ENDIAN
> +#define VDI_128BIT_BUS_SYSTEM_ENDIAN VDI_128BIT_LITTLE_ENDIAN
> +
> +static int wave5_vdi_allocate_common_memory(struct device *dev)
> +{
> +	int ret;
> +	struct vpu_device *vpu_dev = dev_get_drvdata(dev);
> +
> +	if (!vpu_dev->common_mem.vaddr) {
> +		vpu_dev->common_mem.size = SIZE_COMMON;
> +		ret = wave5_vdi_allocate_dma_memory(vpu_dev, &vpu_dev->common_mem);
> +		if (ret) {
> +			dev_err(dev, "unable to allocate common buffer\n");
> +			return ret;
> +		}
> +	}
> +
> +	dev_dbg(dev, "common_mem: daddr=%pad size=%zu vaddr=0x%p\n",
> +		&vpu_dev->common_mem.daddr, vpu_dev->common_mem.size,
> +			vpu_dev->common_mem.vaddr);
> +
> +	return 0;
> +}
> +
> +int wave5_vdi_init(struct device *dev)
> +{
> +	struct vpu_device *vpu_dev = dev_get_drvdata(dev);
> +	int i;
> +	int ret;
> +
> +	ret = wave5_vdi_allocate_common_memory(dev);
> +	if (ret < 0) {
> +		dev_err(dev, "[VDI] fail to get vpu common buffer from driver\n");
> +		return ret;
> +	}
> +
> +	if (PRODUCT_CODE_W_SERIES(vpu_dev->product_code)) {
> +		// if BIT processor is not running.
> +		if (wave5_vdi_read_register(vpu_dev, W5_VCPU_CUR_PC) == 0) {
> +			for (i = 0; i < 64; i++)
> +				wave5_vdi_write_register(vpu_dev, (i * 4) + 0x100, 0x0);
> +		}
> +	} else {
> +		WARN_ONCE(1, "unsupported product code 0x%x\n", vpu_dev->product_code);
> +	}
> +
> +	dev_dbg(dev, "[VDI] success to init driver\n");
> +
> +	return 0;
> +
> +	wave5_vdi_release(dev);
> +	return ret;

Delete this dead code.

> +}
> +
> +int wave5_vdi_release(struct device *dev)
> +{
> +	struct vpu_device *vpu_dev = dev_get_drvdata(dev);
> +
> +	memset(&vpu_dev->vdb_register, 0x00, sizeof(vpu_dev->vdb_register));
> +	wave5_vdi_free_dma_memory(vpu_dev, &vpu_dev->common_mem);
> +
> +	return 0;
> +}
> +
> +void wave5_vdi_write_register(struct vpu_device *vpu_dev, unsigned int addr, unsigned int data)
> +{
> +	writel(data, vpu_dev->vdb_register.vaddr + addr);
> +}
> +
> +unsigned int wave5_vdi_read_register(struct vpu_device *vpu_dev, unsigned int addr)
> +{
> +	return readl(vpu_dev->vdb_register.vaddr + addr);
> +}
> +
> +int wave5_vdi_clear_memory(struct vpu_device *vpu_dev, struct vpu_buf *vb)
> +{
> +	if (!vb || !vb->vaddr) {
> +		dev_err(vpu_dev->dev, "%s(): unable to clear unmapped buffer\n", __func__);
> +		return -EINVAL;
> +	}
> +
> +	memset(vb->vaddr, 0, vb->size);
> +	return vb->size;
> +}
> +
> +static int wave5_swap_endian(struct vpu_device *vpu_dev, u8 *data, int len, int endian);
> +
> +int wave5_vdi_write_memory(struct vpu_device *vpu_dev, struct vpu_buf *vb, size_t offset,
> +			   u8 *data, int len, int endian)
> +{
> +	if (!vb || !vb->vaddr) {
> +		dev_err(vpu_dev->dev, "%s(): unable to write to unmapped buffer\n", __func__);
> +		return -EINVAL;
> +	}
> +
> +	if ((offset + len) > vb->size) {

I wish there were an integer overflow check on this.

	if (offset > vb->size || len > vb->size || offset + len > vb->size) {


> +		dev_err(vpu_dev->dev, "%s(): buffer too small\n", __func__);
> +		return -ENOSPC;
> +	}
> +
> +	wave5_swap_endian(vpu_dev, data, len, endian);
> +	memcpy(vb->vaddr + offset, data, len);
> +
> +	return len;
> +}
> +
> +int wave5_vdi_allocate_dma_memory(struct vpu_device *vpu_dev, struct vpu_buf *vb)
> +{
> +	void *vaddr;
> +	dma_addr_t daddr;
> +
> +	if (!vb->size) {
> +		dev_err(vpu_dev->dev, "%s(): requested size==0\n", __func__);
> +		return -EINVAL;
> +	}
> +
> +	vaddr = dma_alloc_coherent(vpu_dev->dev, vb->size, &daddr, GFP_KERNEL);
> +	if (!vaddr)
> +		return -ENOMEM;
> +	vb->vaddr = vaddr;
> +	vb->daddr = daddr;
> +
> +	return 0;
> +}
> +
> +void wave5_vdi_free_dma_memory(struct vpu_device *vpu_dev, struct vpu_buf *vb)
> +{
> +	if (vb->size == 0)
> +		return;
> +
> +	if (!vb->vaddr)
> +		dev_err(vpu_dev->dev, "%s(): requested free of unmapped buffer\n", __func__);
> +	else
> +		dma_free_coherent(vpu_dev->dev, vb->size, vb->vaddr, vb->daddr);
> +
> +	memset(vb, 0, sizeof(*vb));
> +}
> +
> +int wave5_vdi_convert_endian(struct vpu_device *vpu_dev, unsigned int endian)
> +{
> +	if (PRODUCT_CODE_W_SERIES(vpu_dev->product_code)) {
> +		switch (endian) {
> +		case VDI_LITTLE_ENDIAN:
> +			endian = 0x00;
> +			break;
> +		case VDI_BIG_ENDIAN:
> +			endian = 0x0f;
> +			break;
> +		case VDI_32BIT_LITTLE_ENDIAN:
> +			endian = 0x04;
> +			break;
> +		case VDI_32BIT_BIG_ENDIAN:
> +			endian = 0x03;
> +			break;
> +		}
> +	}
> +
> +	return (endian & 0x0f);
> +}
> +
> +static void byte_swap(unsigned char *data, int len)
> +{
> +	u8 temp;
> +	s32 i;

s32 is only for hardware specs.  Use int.

> +
> +	for (i = 0; i < len; i += 2) {
> +		temp = data[i];
> +		data[i] = data[i + 1];
> +		data[i + 1] = temp;
> +	}
> +}
> +
> +static void word_swap(unsigned char *data, int len)
> +{
> +	u16 temp;
> +	u16 *ptr = (uint16_t *)data;
> +	s32 i, size = len / (int)sizeof(uint16_t);

No need for this cast.

> +
> +	for (i = 0; i < size; i += 2) {
> +		temp = ptr[i];
> +		ptr[i] = ptr[i + 1];
> +		ptr[i + 1] = temp;
> +	}
> +}
> +
> +static void dword_swap(unsigned char *data, int len)
> +{
> +	u32 temp;
> +	u32 *ptr = (uint32_t *)data;

u32 * on both sides of the assign.

> +	s32 i, size = len / (int)sizeof(uint32_t);
> +
> +	for (i = 0; i < size; i += 2) {
> +		temp = ptr[i];
> +		ptr[i] = ptr[i + 1];
> +		ptr[i + 1] = temp;
> +	}
> +}
> +
> +static void lword_swap(unsigned char *data, int len)
> +{
> +	u64 temp;
> +	u64 *ptr = (uint64_t *)data;
> +	s32 i, size = len / (int)sizeof(uint64_t);
> +
> +	for (i = 0; i < size; i += 2) {
> +		temp = ptr[i];
> +		ptr[i] = ptr[i + 1];
> +		ptr[i + 1] = temp;
> +	}
> +}
> +
> +static int wave5_swap_endian(struct vpu_device *vpu_dev, u8 *data, int len, int endian)
> +{
> +	int changes;
> +	int sys_endian;
> +	bool byte_change, word_change, dword_change, lword_change;
> +
> +	if (PRODUCT_CODE_W_SERIES(vpu_dev->product_code)) {
> +		sys_endian = VDI_128BIT_BUS_SYSTEM_ENDIAN;
> +	} else {
> +		dev_err(vpu_dev->dev, "unknown product id : %08x\n", vpu_dev->product_code);
> +		return -1;

Use proper error codes.  Except no one cares about the error codes so
just make it void.

> +	}
> +
> +	endian = wave5_vdi_convert_endian(vpu_dev, endian);
> +	sys_endian = wave5_vdi_convert_endian(vpu_dev, sys_endian);
> +	if (endian == sys_endian)
> +		return 0;
> +
> +	changes = endian ^ sys_endian;
> +	byte_change = changes & 0x01;
> +	word_change = ((changes & 0x02) == 0x02);
> +	dword_change = ((changes & 0x04) == 0x04);
> +	lword_change = ((changes & 0x08) == 0x08);
> +
> +	if (byte_change)
> +		byte_swap(data, len);
> +	if (word_change)
> +		word_swap(data, len);
> +	if (dword_change)
> +		dword_swap(data, len);
> +	if (lword_change)
> +		lword_swap(data, len);
> +
> +	return 1;

If you decide to go this route, add a comment at the top of the function
explaining the return codes.

> +}

regards,
dan carpenter

