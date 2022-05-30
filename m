Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DD66F5374A9
	for <lists+linux-media@lfdr.de>; Mon, 30 May 2022 09:23:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233301AbiE3HK2 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 30 May 2022 03:10:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49932 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232442AbiE3HK0 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 30 May 2022 03:10:26 -0400
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2BB106FD27
        for <linux-media@vger.kernel.org>; Mon, 30 May 2022 00:10:21 -0700 (PDT)
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
        by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 24U2PuRP018415;
        Mon, 30 May 2022 07:09:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : content-type : in-reply-to : mime-version;
 s=corp-2021-07-09; bh=SdklnZOUveL5Ndo47jh45w0yCe5GhXYvLVnCxhtE6IY=;
 b=nXwAQ7/k/psTE4AeKjDZVWP++VzYpxoBlEhHxr0mNsGH27OwqBwJMAq6nhV9VKW8aXz4
 R2ueGWKmQuv6kEVEZviBrQlkwu+m8G05jE4aa8Vxnfro7U48Nq6bdxiT1DhRykI5TZbE
 IK5VcAlfBmCZzSFUSnqmyyvehOWNy/MHi+KIyR8TBbIFKTeVklsWiJ0ra5nU9e++V9gR
 irpNEnbjHgbF0uVh5tzmQXMhvb2ogI3ca8MUP+2j4MqHzWJGX3nUyiJ+6yLYRp0kXCQU
 l7V63nwv1rDDSrd+ZXS2vQLVkJZoBnGBtFH39ir2ZhhVaKhvPiuxyzjbmzbicUJLnTku aQ== 
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
        by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3gbc4xj6wg-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Mon, 30 May 2022 07:09:51 +0000
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
        by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.16.1.2/8.16.1.2) with SMTP id 24U75Mxo031103;
        Mon, 30 May 2022 07:09:51 GMT
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12lp2172.outbound.protection.outlook.com [104.47.55.172])
        by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com with ESMTP id 3gc8jvx1wc-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Mon, 30 May 2022 07:09:50 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=F77PjmA1fo/Ewod1ozaGHSmOmnOq6scIqIItgbMTrtYHQLS1tNIGLhiunCHvV9X0ljlojemZAs8mNKqJwJgxZOYIFQuC/Yd5i8VNZNyC1T8pGA7wL8b0l8ASP3ldEqwqMsSuw8uMzqFuiumZems1NbDcaL0BAzSnYDCyqj+Ywt6Evahir4+fi0qL9vUZK2qoyldItFWSyuZgzQtcQoUDbB5/X+FjALKoiWHT9qJfOue4BC//VAMW50lOvynhzG+LH882gTuN/7s5oH3h9nqh6WdU8resFB8s+0PB+pwUOdKwT5N99KspI3I5OXX4Xhx+c1ERfXfQfmOryRT9OrKUuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SdklnZOUveL5Ndo47jh45w0yCe5GhXYvLVnCxhtE6IY=;
 b=lEQAD3JIteCWbJkS9eOLb0TJttzNokeZm2Sx0hd09YVWDbr8Yni7sG+9yKuYUKFflQdxPbG9yiBtkjnVviKcoiaYrzbVd4dgPw7nDhq3lTIvl/WxNOFi+MEG/+Sb1Gq9/MGKMqZ0NqloWRAX2x2Gn/m2f+LzucIGeJFfRvgm9GPDVTasBIF2DLWoUzF0gEMf9QAw/CObSgDS+JDhx/Jwck3Ejt+U65thtjmdCI17yDQVpz2nGt1v7bbPJxxS0oTCG5QyC0Ak2w1h63Ld9MzBqDAoel0MgSGL6tJEN1/IxIdKCikbhqISffJyvcvjohV6HVzqIz8IQI6taKl0Z3F/Tw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SdklnZOUveL5Ndo47jh45w0yCe5GhXYvLVnCxhtE6IY=;
 b=JMChmN/KECYg/Fry06d2dri3QQhsQ8SaXtlKSN+tvr/xPsO67RInMqUX10jv/5SY8ignfM/nN6xAj7KBTxaSe+h7Vh1tRS2iDnNMwUkDKyD92TTYGrLjaTFyKrJk3ZvIis6AnRh4JVv+Nzni0vt9F9oJLB2CAf+8nff3++v2GM8=
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by SN6PR10MB3038.namprd10.prod.outlook.com
 (2603:10b6:805:d2::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5293.13; Mon, 30 May
 2022 07:09:49 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::86f:81ba:9951:5a7e]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::86f:81ba:9951:5a7e%2]) with mapi id 15.20.5293.019; Mon, 30 May 2022
 07:09:48 +0000
Date:   Mon, 30 May 2022 10:09:15 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     kbuild@lists.01.org,
        Dmitry Osipenko <dmitry.osipenko@collabora.com>,
        David Airlie <airlied@linux.ie>,
        Gerd Hoffmann <kraxel@redhat.com>,
        Gurchetan Singh <gurchetansingh@chromium.org>,
        Chia-I Wu <olvaffe@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
        Daniel Almeida <daniel.almeida@collabora.com>,
        Gert Wollny <gert.wollny@collabora.com>,
        Gustavo Padovan <gustavo.padovan@collabora.com>,
        Daniel Stone <daniel@fooishbar.org>,
        Tomeu Vizoso <tomeu.vizoso@collabora.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Rob Herring <robh@kernel.org>,
        Steven Price <steven.price@arm.com>,
        Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
        Rob Clark <robdclark@gmail.com>,
        Emil Velikov <emil.l.velikov@gmail.com>,
        Robin Murphy <robin.murphy@arm.com>,
        Qiang Yu <yuq825@gmail.com>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
        "Pan, Xinhui" <Xinhui.Pan@amd.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Tomasz Figa <tfiga@chromium.org>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Alex Deucher <alexander.deucher@amd.com>,
        Jani Nikula <jani.nikula@linux.intel.com>
Cc:     lkp@intel.com, kbuild-all@lists.01.org, linux-media@vger.kernel.org
Subject: [kbuild] Re: [PATCH v6 17/22] drm/shmem-helper: Add generic memory
 shrinker
Message-ID: <202205272155.MxDiru43-lkp@intel.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220526235040.678984-18-dmitry.osipenko@collabora.com>
Message-ID-Hash: ZNYGPFYONFY6H6EQKHYYFHQUUQFG7VR5
User-Agent: Mutt/1.9.4 (2018-02-28)
X-ClientProxiedBy: JNAP275CA0033.ZAFP275.PROD.OUTLOOK.COM (2603:1086:0:4d::14)
 To MWHPR1001MB2365.namprd10.prod.outlook.com (2603:10b6:301:2d::28)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7a3624db-285c-454f-9c0b-08da420b622d
X-MS-TrafficTypeDiagnostic: SN6PR10MB3038:EE_
X-Microsoft-Antispam-PRVS: <SN6PR10MB303824A25F3D4847F0B7F4188EDD9@SN6PR10MB3038.namprd10.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 94/qiaH1TJ/1gxIE6yfu1FHCrNvXqA63KrwA/ZfAtVO2U+/kCF7WWGBQHqy16X5SWKpOojtiTi+2ALuQLvp5YQ/B7CChCiIsiG2kLzYGLG0itJ19e56JCp7TbjcebL8rAvGvlK9bBdEV2d3KnO/SZmRIbH/EbJxihbuhwB2WGSNrzH3PfsMBIb53GVncMcWpRDJIcMgQMto0BAUcNOnOmIfkI0PmDUfPK56K0HDPNwQ3P1SbjwZ84Zcrai7PPmGjoInnRmQzVrc+453x7Hsn5IHkoLoLeODMV4Gw3bTCj9x2r5EoCTR4RY3PJQaVfvqLs8hNUB+T/SpDKp3jVAm+9g/R5YuFLu2jzoBPDPQ1tklZRZFzAmwwM+ZbZJS8o+BqbCBIMhbP0UbV3fxC9AKhwc0k7uwHsptiIZwjYZJF8NcZS97bf141wSC2vQacasjTmrZDtg5mjFEMgvCjNWgYyVqYMNgaO9xdufvFOt5PnT7KFDWtRwtTezVtc2nBmp8+6JUSQaD8gXSpO814IyiKEEA7LSXhtIOwOZf0hkrHvn1JpY25apjJ6RLf+xy6yzGX9paztkCfTMpl1pD1y56LbJuccqGhhcWknSbBlRn9Zw60WY9zYbaEAozT468t3H+tMZIrV5xvi51Qt4Xt0XidUpwuO9Y3ALMqpwUs619otMyWjVgcKIDrI0r1OihQqAomWO2/iqM6yBE7y0UQA/hLIr6oeN98AubNRB9AyL0B4FJiqKVGQhD46td2QP91YKG0Cw89I6AcoayiDvACmOoMqItb5yhiHskk0B2VQElo1rrWvURhUQc/ErXAJVMZwaaiMMfkY7nHqO4fYNGeWOp3r/zE4dsNbnYm/YpAnFeOwOOSABrAx5nWBIfobHpbu95M
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MWHPR1001MB2365.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(508600001)(44832011)(5660300002)(66946007)(6486002)(66556008)(8936002)(52116002)(7416002)(7406005)(6506007)(86362001)(966005)(9686003)(26005)(6512007)(6666004)(2906002)(921005)(38100700002)(38350700002)(1076003)(186003)(83380400001)(110136005)(316002)(4326008)(36756003)(8676002)(66476007)(41533002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?htDd0hoSmtH+JXZ0PMioyofjTzk1U0o7xseP3gcEIUjYCMD21qiQHBsi6ipa?=
 =?us-ascii?Q?vfeG4N237iQNg2h7vswGEOqW4iwuq6QIJHExigG2kZIE9iH476xkuRe/SYep?=
 =?us-ascii?Q?09FvwX+640Bix1qWhopTXa9su7xnWggi/ofeqJU+b6kIWRGNeMqGfspcKkZ7?=
 =?us-ascii?Q?00BDuL90LwPbZXrlB12eJmihWlm4hvlQ7/vqiTXFKy2VKUvdp1VGq/CkOnBU?=
 =?us-ascii?Q?kFHG3/wTPdSca0jaUAtWes9WQTDiZdmjDL2rNFF6rSnimeaQBaFsp5lzTl3M?=
 =?us-ascii?Q?UO2y/i9gCsTaxfrGFUSIjWsUUBoJHaPUD5R3nlN8cYhUIOA6R0I5Kt6YTKgy?=
 =?us-ascii?Q?vFzYiE1hYA2hcWkecn45PQmi+haO1W9K9Qm5yfaPEVHx2StzDSh5T19d1fRb?=
 =?us-ascii?Q?STkaVlsJ/AYMjko0RRhhknJiO9nZ2VAxuPPU0/kDMC49msCQn497o15n2uKn?=
 =?us-ascii?Q?C8L7BXNYtBjd9yIWozySJqrZSK7UlpD6v2npal93kt27LItsgfvbkaQC0ZYR?=
 =?us-ascii?Q?yIcWc1PotWSnmigAVVyaWkV2fR0d7OxhnXeTaYSaVoMw+ykc17zXVnT567Jx?=
 =?us-ascii?Q?XFZj9n5G0oFcbOaBYYu2KAj83rbdU266hVHyy2hTG0fnqjGPhRBTVhq9/NFd?=
 =?us-ascii?Q?WaocA4V+O4GsLYhWK46hOC972bzmv1t5pcLh0XhZN7yW9IrBFpBPpTXVbDFo?=
 =?us-ascii?Q?8IP1wPIjaxPQZZCp1OteJNNwMUlK8MQt86Gv6LOSjwYNXDr+fUKSUJqa5Rml?=
 =?us-ascii?Q?gTLDuJbvNqXnK3pl8HQrB5nh9mLY4DuEZ68UlmkAodxXUp4a6wqzN/iy1v42?=
 =?us-ascii?Q?uUlqNP4rtiMZvqiZZD8J3k6A+Yxz2WgHsxFRDBiErWvzB9ZEtjQ7RpGNXLN8?=
 =?us-ascii?Q?XXpjxKetH3xrN5UW7S+DWHBVY3RB5f+pr2ghtHC09YutlYp/h1Oudk17IZyO?=
 =?us-ascii?Q?bRuhx8R/PqmwEZmgbKh4L3qENy2WIuDyyOaOirOqe5ql36dWGLmh7q94Csdc?=
 =?us-ascii?Q?SboVFrINqPEgvlL6HWqjRkfQfDfXnHXnNL2EbQmCN1NvnCwdzpXZhRfELsAE?=
 =?us-ascii?Q?TZzdxdAV51pEDjGWIXn0DTls8hAuNg9PvH/3wjtdNX498WWkBIRdKi11HmId?=
 =?us-ascii?Q?XOGndDmzFjWjETcX2ULazYhsuwEet5PqvoAG/YZ/BAY5I6qlhjo7h7lmyVCR?=
 =?us-ascii?Q?3AKGkD4hM2wBytBTVuSG77UAMtZ/bycefTz8EWzuG9fp0k2F23aZdQhnMkcV?=
 =?us-ascii?Q?EldEssRVExe3+2enn9FJUevkZjjqS6X8JvQxOL1xTKX6z5Lad2AUE+GCO8JF?=
 =?us-ascii?Q?Bn0CDX5ZySiBGxHwOdzFFVefXEVBDuKDzBQJZRHDun964fIOFT9W4K5mtR9+?=
 =?us-ascii?Q?wVeYBS5el2W5RinrNHoJPhn5o6Nhy7gpq7Up1tGyg5NlKUSb4W8WNtZgjQrk?=
 =?us-ascii?Q?Ve6pn7wjlcgiEe43OrC2GeqlMS5p8tJJ+NmNiYpDYWP0vIYtI+pvKuwfimWM?=
 =?us-ascii?Q?0MASz5GBEkNr5vMwnUkP2gmrYt1Bh0RURvB39Zd/wkP1lwIaZCCicpVorj3V?=
 =?us-ascii?Q?ihWkr9amNxj7ZZhgoXcc+4yxLWcG/D5TZ3v7I/Uf5fXWf6NeBbdk/ISPndhz?=
 =?us-ascii?Q?wVBz1RDhgNgBFhheK+6gDKlQK2PHCasJQvV9AnBgZx76UfQEGxKAJjfIIrg4?=
 =?us-ascii?Q?T6BkhndXf6rgJ8WranzauTo5ze0fnElSWEg89WA+Xqs9Q9hU51xEpem4+bpn?=
 =?us-ascii?Q?oXlBFC7oPdtYnTAQ72kyZKo7vf5Qks4=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7a3624db-285c-454f-9c0b-08da420b622d
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 May 2022 07:09:48.7763
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vP3XRnzOqJCKD5To0wArnusQ6NsoxaOJ1YIOhLzXNeXLSPSboEQ74VTMH6DXYrs7JpMRCrQv8UhHMGsnA4MN0Bxg2KRghbl3XW4hLo0buAk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR10MB3038
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.486,18.0.874
 definitions=2022-05-30_02:2022-05-27,2022-05-30 signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 mlxscore=0
 suspectscore=0 spamscore=0 phishscore=0 malwarescore=0 bulkscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2204290000 definitions=main-2205300037
X-Proofpoint-GUID: EhcdP2LAF-aGdT2At2rKxpe4SkhwKBOB
X-Proofpoint-ORIG-GUID: EhcdP2LAF-aGdT2At2rKxpe4SkhwKBOB
X-Spam-Status: No, score=-1.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,HEXHASH_WORD,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Dmitry,

url:    https://github.com/intel-lab-lkp/linux/commits/Dmitry-Osipenko/Add-generic-memory-shrinker-to-VirtIO-GPU-and-Panfrost-DRM-drivers/20220527-075717 
base:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git  cdeffe87f790dfd1baa193020411ce9a538446d7
config: i386-randconfig-m021 (https://download.01.org/0day-ci/archive/20220527/202205272155.MxDiru43-lkp@intel.com/config )
compiler: gcc-11 (Debian 11.3.0-1) 11.3.0

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

New smatch warnings:
drivers/gpu/drm/drm_gem_shmem_helper.c:226 drm_gem_shmem_set_evictable() warn: inconsistent returns 'shmem->base.resv'.
drivers/gpu/drm/drm_gem_shmem_helper.c:253 drm_gem_shmem_set_purgeable() warn: inconsistent returns 'shmem->base.resv'.
drivers/gpu/drm/drm_gem_shmem_helper.c:703 drm_gem_shmem_fault() error: we previously assumed 'shmem->pages' could be null (see line 694)

vim +226 drivers/gpu/drm/drm_gem_shmem_helper.c

875fd932de880a Dmitry Osipenko 2022-05-27  215  int drm_gem_shmem_set_evictable(struct drm_gem_shmem_object *shmem)
875fd932de880a Dmitry Osipenko 2022-05-27  216  {
875fd932de880a Dmitry Osipenko 2022-05-27  217  	dma_resv_lock(shmem->base.resv, NULL);
875fd932de880a Dmitry Osipenko 2022-05-27  218  
875fd932de880a Dmitry Osipenko 2022-05-27  219  	if (shmem->madv < 0)
875fd932de880a Dmitry Osipenko 2022-05-27  220  		return -ENOMEM;

Unlock before returning?

875fd932de880a Dmitry Osipenko 2022-05-27  221  
875fd932de880a Dmitry Osipenko 2022-05-27  222  	shmem->eviction_enabled = true;
875fd932de880a Dmitry Osipenko 2022-05-27  223  
875fd932de880a Dmitry Osipenko 2022-05-27  224  	dma_resv_unlock(shmem->base.resv);
875fd932de880a Dmitry Osipenko 2022-05-27  225  
875fd932de880a Dmitry Osipenko 2022-05-27 @226  	return 0;
875fd932de880a Dmitry Osipenko 2022-05-27  227  }
875fd932de880a Dmitry Osipenko 2022-05-27  228  EXPORT_SYMBOL_GPL(drm_gem_shmem_set_evictable);
875fd932de880a Dmitry Osipenko 2022-05-27  229  
875fd932de880a Dmitry Osipenko 2022-05-27  230  /**
875fd932de880a Dmitry Osipenko 2022-05-27  231   * drm_gem_shmem_set_purgeable() - Make GEM purgeable by memory shrinker
875fd932de880a Dmitry Osipenko 2022-05-27  232   * @shmem: shmem GEM object
875fd932de880a Dmitry Osipenko 2022-05-27  233   *
875fd932de880a Dmitry Osipenko 2022-05-27  234   * Tell memory shrinker that this GEM can be purged. Initially purging is
875fd932de880a Dmitry Osipenko 2022-05-27  235   * disabled for all GEMs. If GEM was purged, then -ENOMEM is returned.
875fd932de880a Dmitry Osipenko 2022-05-27  236   *
875fd932de880a Dmitry Osipenko 2022-05-27  237   * Returns:
875fd932de880a Dmitry Osipenko 2022-05-27  238   * 0 on success or a negative error code on failure.
875fd932de880a Dmitry Osipenko 2022-05-27  239   */
875fd932de880a Dmitry Osipenko 2022-05-27  240  int drm_gem_shmem_set_purgeable(struct drm_gem_shmem_object *shmem)
875fd932de880a Dmitry Osipenko 2022-05-27  241  {
875fd932de880a Dmitry Osipenko 2022-05-27  242  	dma_resv_lock(shmem->base.resv, NULL);
875fd932de880a Dmitry Osipenko 2022-05-27  243  
875fd932de880a Dmitry Osipenko 2022-05-27  244  	if (shmem->madv < 0)
875fd932de880a Dmitry Osipenko 2022-05-27  245  		return -ENOMEM;

Same.

875fd932de880a Dmitry Osipenko 2022-05-27  246  
875fd932de880a Dmitry Osipenko 2022-05-27  247  	shmem->purge_enabled = true;
875fd932de880a Dmitry Osipenko 2022-05-27  248  
875fd932de880a Dmitry Osipenko 2022-05-27  249  	drm_gem_shmem_update_pages_state(shmem);
875fd932de880a Dmitry Osipenko 2022-05-27  250  
875fd932de880a Dmitry Osipenko 2022-05-27  251  	dma_resv_unlock(shmem->base.resv);
875fd932de880a Dmitry Osipenko 2022-05-27  252  
875fd932de880a Dmitry Osipenko 2022-05-27 @253  	return 0;
875fd932de880a Dmitry Osipenko 2022-05-27  254  }

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp 
_______________________________________________
kbuild mailing list -- kbuild@lists.01.org
To unsubscribe send an email to kbuild-leave@lists.01.org

