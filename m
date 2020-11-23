Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 24C5B2C04FB
	for <lists+linux-media@lfdr.de>; Mon, 23 Nov 2020 12:54:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729255AbgKWLw5 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 23 Nov 2020 06:52:57 -0500
Received: from mail-mw2nam12on2048.outbound.protection.outlook.com ([40.107.244.48]:21024
        "EHLO NAM12-MW2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1728907AbgKWLw4 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 23 Nov 2020 06:52:56 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IbcARMEDh8LjJ6WVMIOSrNM0HVNjD1Ju+qhk+NVBx9A+yFTn2Yk7msEer39VZde/GCD0VfIPw7RhTz53i2HD0m+DqoXHvsir0ebGPx+E+dQnu3Sf0cirIRk4YkNZfZpww/gj652S1+K+UKzIRPvrTf1FosXcN55WKp3j7M9ddqf/LEizA/1TuPI/v1DwVBU4hEqpSpK9QSAxlJbbraN/0xdD9H8xSKea+TTHOK9rBuSgAXN+iUbAZkJ8rJ29NhuWYFTgSYlbitldM7GL79+GmbAZpWnt8I2bseM5JK28dXzhcbi05zsaQA9B/oxg9MqYtDOvHbklze5B6GSnpSaFGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=O2UqfUcJUN3AKI5fYjjOMDFx/xGxNzc+Dmq0EqpX1/s=;
 b=F3PkOxTyLTQ6ys/hZr9XkwoD4r1tzF0DBVgAo4zgnq0u4xjtzZuFMyTzchkEcPanykUuTYzV7qqTdhOU2KsYtHPraWjdmozThnvu7tdpw12L3RxSW5aZWVBNjLf/ev34HvFzXlJJl8csLNh4znuciXoLnuMh3D3ujBz04eAjysSWv57EGwcGjoYNJYnNsV6ACFZr9URrEP0uIjiZnla9XnYvM+Z+Gi3olt9PqSraPeCKemHCe0Q+LdjWU3GXr58lFkZbJFuh+brCWLWwPgurHH3iEK+lPNrCcDiK9YfhQFYdCFSxH10S8rBVPpObL+eYLek2MuPoomz65hgzzAyZHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=O2UqfUcJUN3AKI5fYjjOMDFx/xGxNzc+Dmq0EqpX1/s=;
 b=mc+/qOirh6MPN+QIg+xjn44/EfE2Yi9xnKXia7bETfU5N+KiW/jLFZoWLCRfCp1BKYHhcudps0lxsEXoa/nLIKdPzzGhGQ0jAenhmiiwglwDoNyO8G7hCUT5EulafcrEBQ5wQZplhpS1jFoZ+Hh2zNk4+3tIp2WRfvR4xM4j7cg=
Authentication-Results: amd.com; dkim=none (message not signed)
 header.d=none;amd.com; dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by MN2PR12MB4253.namprd12.prod.outlook.com (2603:10b6:208:1de::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3589.22; Mon, 23 Nov
 2020 11:52:51 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::1ccc:8a9a:45d3:dd31]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::1ccc:8a9a:45d3:dd31%7]) with mapi id 15.20.3589.022; Mon, 23 Nov 2020
 11:52:51 +0000
Subject: Re: [PATCH 00/40] [Set 8] Rid W=1 warnings from GPU
To:     Lee Jones <lee.jones@linaro.org>
Cc:     linux-kernel@vger.kernel.org,
        Alex Deucher <alexander.deucher@amd.com>,
        amd-gfx@lists.freedesktop.org, Ben Skeggs <bskeggs@redhat.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        David Airlie <airlied@linux.ie>,
        Drew Davenport <ddavenport@chromium.org>,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        Fritz Koenig <frkoenig@google.com>,
        Hawking Zhang <Hawking.Zhang@amd.com>,
        Huang Rui <ray.huang@amd.com>,
        Jerome Glisse <glisse@freedesktop.org>,
        Jiansong Chen <Jiansong.Chen@amd.com>,
        Jonathan Marek <jonathan@marek.ca>,
        Kalyan Thota <kalyan_t@codeaurora.org>,
        Likun Gao <Likun.Gao@amd.com>, linaro-mm-sig@lists.linaro.org,
        linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        Luben Tuikov <luben.tuikov@amd.com>,
        nouveau@lists.freedesktop.org,
        Qinglang Miao <miaoqinglang@huawei.com>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Sonny Jiang <sonny.jiang@amd.com>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Tao Zhou <tao.zhou1@amd.com>
References: <20201123111919.233376-1-lee.jones@linaro.org>
From:   =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <feda98c5-a677-7bf5-c1e7-2bf311ba8097@amd.com>
Date:   Mon, 23 Nov 2020 12:52:42 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <20201123111919.233376-1-lee.jones@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Originating-IP: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
X-ClientProxiedBy: AM0PR10CA0096.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:208:15::49) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7] (2a02:908:1252:fb60:be8a:bd56:1f94:86e7) by AM0PR10CA0096.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:208:15::49) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3589.21 via Frontend Transport; Mon, 23 Nov 2020 11:52:46 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: b4545c6a-2257-4798-5d3f-08d88fa64dab
X-MS-TrafficTypeDiagnostic: MN2PR12MB4253:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MN2PR12MB4253068F62324FA631365AFE83FC0@MN2PR12MB4253.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3631;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 01u/96N2kPMIwQk1vyLAenWpejMhU93MLr3wMYnxbPiTuNiIeRpCiUhMpbD5GG0b659s9p/QwLQqiOM27VUPLUFOe9LhRh49NLOi00ofaVFOSy0FxqIyevl9+mXyLezw3OCyLkwKAYmF7KUJ1nJ/aZZqWV8Urvytb/2fl4NyjXajNRVsMHg56jt2uICxZqfZsg1Ft0jn3QVaClQ5IrAOR3J/ZXjGCi/yuMrpMufyD9ZAdZUI1lxI0x1eamv1rEg6iibSc8L2kSi9CFjPWM+Y7Cp9aL0l9iSwe8IWN9pnJQ4J9Y9I/dn3vSg3RPAtUeTlJKQauazwv5w+xf1AIyo2qy57P/yL2UjqCKFxj5dCuA7sGac4SpDuNY4G3wT5w4JL
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN2PR12MB3775.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(136003)(39860400002)(346002)(366004)(376002)(52116002)(8676002)(478600001)(8936002)(66946007)(36756003)(86362001)(4326008)(66476007)(66556008)(7416002)(6916009)(83380400001)(2906002)(2616005)(186003)(16526019)(5660300002)(6486002)(316002)(31686004)(6666004)(66574015)(54906003)(31696002)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?Z3RBU0JGY05odXZNVTlDb1J5OHJWV0lvSU1QVi9XNVBQUUhjOUZtRjB1L2VZ?=
 =?utf-8?B?WGZzaHpmMHpkck5jSmhqellsREJjZHJIK2poU21FaHYrRVFVWTIrNTkwSWR1?=
 =?utf-8?B?UGdxUXV3bXpLb0hIUnVUV1JWVTh3MHRlZ20waEE1SDVtQVRrWk9zckFlUUtn?=
 =?utf-8?B?V1d5U1pYZlJzdFg3RXozWmdEMUJCdXovY1JzSHlMWjFWblkyRldubjBnMFBT?=
 =?utf-8?B?a0JSbDIvLzVPUzJvdEpvbVl5NC9sa2hHUFVaZ1dEY1BZYlliVnMwL1JVc3pO?=
 =?utf-8?B?eURsMGQ0OWVQVEtLeXkxUDJ0bnBHUnJmV1FhVUF2a2ZKODZoeW9BQnk3eXFS?=
 =?utf-8?B?bXRDdVZmMXY0T2puV0czQW1jellzV1Exbks3M3dGYXpiUnU3R0phOVJZV3ZK?=
 =?utf-8?B?UldxY0pZSC95THRLdkQybFBsWTBrYlZVTWUrQmxHcm9iTTI0bUtLS0hMd0Zy?=
 =?utf-8?B?TkVYWWJHeUdFWVp6a0k1T096YVM0ZVRncU1DV0l0RXZadXNKMUhJVWlnSjEz?=
 =?utf-8?B?K2Q0MGhqQ2k2cUJXaUE1WFN3VzdWaTdtOCtmTHdPMHRjSnhiZmZlS0tzNk03?=
 =?utf-8?B?YkhTTCtPWmdLZHUvRkh5WDRWNlVNTWlXR0ZHaGN1RTV1ZmMva1ZtdVBnUGpC?=
 =?utf-8?B?OVdveFNwT1N4S25EZmRNU2tkZjAvUmxvRjhWQXErbFA2RG80WkNHMHJnRUFO?=
 =?utf-8?B?Mkdwak9BeGdld3JuVXM1YmZ3UDBSL2lrNE9yb2VCbEJEaFhUeXErZVJxMU5I?=
 =?utf-8?B?eUpkbFFnWitJZitqZjNSREM1K3NYK281NTZEU25ZZlF6ZWxzVnFCQWlsald3?=
 =?utf-8?B?UnplS0o0Vmd1bXVJTkZIdEZqdWZKSWhUWWhLOEVjQVBuVjN4N0s4VG5lM2x4?=
 =?utf-8?B?U1VLYUhmRzUwdjJyUUJoTGg2SUxKazh6SElvVk5pMWFXYnN5SE01bWxCVTVk?=
 =?utf-8?B?OTc0SzNvWVFwcXZQelFiUTRuTGlvbkNJb0Y2UCtGOS9QcUNqTGo1d25SRWZP?=
 =?utf-8?B?VXFtUkR4aVhmdldIbERoNFRGRU9TZ0xlOFNzUXlQa1RjdmwwSlpSQmtBTGhO?=
 =?utf-8?B?R0JKRDJydW1GZUtKS2VhRzBOTXR6SDd4THY1YktIMkpjRDlVSTNFVHhkWENq?=
 =?utf-8?B?bkJlc2JEQmhsNXNDZ2tYQkxpejFQZ2JrZC96VWZ4UE5xcHBqdlowczYwc0Zn?=
 =?utf-8?B?MXlqK0E5UndDMmxLQ05aRVVvckFPVEplQlY5UkV2SDlKeVRKbng1SXowR3FL?=
 =?utf-8?B?UmNNbDZpS3Y0K2J4VDBkNHFTcUJzbnlaT3BEYzEyaitCS2o3UT09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b4545c6a-2257-4798-5d3f-08d88fa64dab
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Nov 2020 11:52:50.7681
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 72ca23NHRM+6fJd1PNpDCwUfyIWtXq6ebyA/OMF5QifwEXoC8lFSFOHfxgr03dwq
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4253
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Only skimmed over them, but over all looks sane to me.

Series is Acked-by: Christian König <christian.koenig@amd.com>

Thanks,
Christian.

Am 23.11.20 um 12:18 schrieb Lee Jones:
> This set is part of a larger effort attempting to clean-up W=1
> kernel builds, which are currently overwhelmingly riddled with
> niggly little warnings.
>
> Only 900 (from 5000) to go!
>
> Lee Jones (40):
>    drm/radeon/radeon_device: Consume our own header where the prototypes
>      are located
>    drm/amd/amdgpu/amdgpu_ttm: Add description for 'page_flags'
>    drm/amd/amdgpu/amdgpu_ib: Provide docs for 'amdgpu_ib_schedule()'s
>      'job' param
>    drm/amd/amdgpu/amdgpu_virt: Correct possible copy/paste or doc-rot
>      misnaming issue
>    drm/amd/amdgpu/cik_ih: Supply description for 'ih' in
>      'cik_ih_{get,set}_wptr()'
>    drm/amd/amdgpu/uvd_v4_2: Fix some kernel-doc misdemeanours
>    drm/amd/amdgpu/dce_v8_0: Supply description for 'async'
>    drm/amd/amdgpu/cik_sdma: Supply some missing function param
>      descriptions
>    drm/amd/amdgpu/gfx_v7_0: Clean-up a bunch of kernel-doc related issues
>    drm/msm/disp/dpu1/dpu_core_perf: Fix kernel-doc formatting issues
>    drm/msm/disp/dpu1/dpu_hw_blk: Add one missing and remove an extra
>      param description
>    drm/msm/disp/dpu1/dpu_formats: Demote non-conformant kernel-doc header
>    drm/msm/disp/dpu1/dpu_hw_catalog: Remove duplicated initialisation of
>      'max_linewidth'
>    drm/msm/disp/dpu1/dpu_hw_catalog: Move definitions to the only place
>      they are used
>    drm/nouveau/nvkm/subdev/bios/init: Demote obvious abuse of kernel-doc
>    drm/amd/amdgpu/si_dma: Fix a bunch of function documentation issues
>    drm/amd/amdgpu/gfx_v6_0: Supply description for
>      'gfx_v6_0_ring_test_ib()'s 'timeout' param
>    drm/msm/disp/dpu1/dpu_encoder: Fix a few parameter/member formatting
>      issues
>    drm/msm/disp/dpu1/dpu_hw_lm: Fix misnaming of parameter 'ctx'
>    drm/msm/disp/dpu1/dpu_hw_sspp: Fix kernel-doc formatting abuse
>    drm/amd/amdgpu/uvd_v3_1: Fix-up some documentation issues
>    drm/amd/amdgpu/dce_v6_0: Fix formatting and missing parameter
>      description issues
>    drm/amd/include/vega20_ip_offset: Mark top-level IP_BASE definition as
>      __maybe_unused
>    drm/amd/include/navi10_ip_offset: Mark top-level IP_BASE as
>      __maybe_unused
>    drm/amd/include/arct_ip_offset: Mark top-level IP_BASE definition as
>      __maybe_unused
>    drm/amd/include/navi14_ip_offset: Mark top-level IP_BASE as
>      __maybe_unused
>    drm/amd/include/navi12_ip_offset: Mark top-level IP_BASE as
>      __maybe_unused
>    drm/amd/include/sienna_cichlid_ip_offset: Mark top-level IP_BASE as
>      __maybe_unused
>    drm/amd/include/vangogh_ip_offset: Mark top-level IP_BASE as
>      __maybe_unused
>    drm/amd/include/dimgrey_cavefish_ip_offset: Mark top-level IP_BASE as
>      __maybe_unused
>    drm/msm/disp/dpu1/dpu_rm: Fix formatting issues and supply
>      'global_state' description
>    drm/msm/disp/dpu1/dpu_vbif: Fix a couple of function param
>      descriptions
>    drm/amd/amdgpu/cik_sdma: Add one and remove another function param
>      description
>    drm/amd/amdgpu/uvd_v4_2: Add one and remove another function param
>      description
>    drm/msm/disp/dpu1/dpu_plane: Fix some spelling and missing function
>      param descriptions
>    drm/amd/amdgpu/gmc_v7_0: Add some missing kernel-doc descriptions
>    drm/amd/amdgpu/gmc_v8_0: Fix more issues attributed to copy/paste
>    drm/msm/msm_drv: Make '_msm_ioremap()' static
>    drm/amd/amdgpu/gmc_v9_0: Remove unused table
>      'ecc_umc_mcumc_status_addrs'
>    drm/amd/amdgpu/gmc_v9_0: Suppy some missing function doc descriptions
>
>   drivers/gpu/drm/amd/amdgpu/amdgpu_ib.c        |   1 +
>   drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c       |   1 +
>   drivers/gpu/drm/amd/amdgpu/amdgpu_virt.c      |  12 +-
>   drivers/gpu/drm/amd/amdgpu/cik_ih.c           |   2 +
>   drivers/gpu/drm/amd/amdgpu/cik_sdma.c         |  18 ++-
>   drivers/gpu/drm/amd/amdgpu/dce_v6_0.c         |   2 +-
>   drivers/gpu/drm/amd/amdgpu/dce_v8_0.c         |   1 +
>   drivers/gpu/drm/amd/amdgpu/gfx_v6_0.c         |   1 +
>   drivers/gpu/drm/amd/amdgpu/gfx_v7_0.c         |  33 +++--
>   drivers/gpu/drm/amd/amdgpu/gmc_v7_0.c         |   7 +-
>   drivers/gpu/drm/amd/amdgpu/gmc_v8_0.c         |   5 +
>   drivers/gpu/drm/amd/amdgpu/gmc_v9_0.c         |  38 +----
>   drivers/gpu/drm/amd/amdgpu/si_dma.c           |  14 +-
>   drivers/gpu/drm/amd/amdgpu/uvd_v3_1.c         |  10 +-
>   drivers/gpu/drm/amd/amdgpu/uvd_v4_2.c         |  10 +-
>   drivers/gpu/drm/amd/include/arct_ip_offset.h  |   4 +-
>   .../amd/include/dimgrey_cavefish_ip_offset.h  |   2 +-
>   .../gpu/drm/amd/include/navi10_ip_offset.h    |   2 +-
>   .../gpu/drm/amd/include/navi12_ip_offset.h    |   2 +-
>   .../gpu/drm/amd/include/navi14_ip_offset.h    |   2 +-
>   .../amd/include/sienna_cichlid_ip_offset.h    |   2 +-
>   .../gpu/drm/amd/include/vangogh_ip_offset.h   |   2 +-
>   .../gpu/drm/amd/include/vega20_ip_offset.h    |   2 +-
>   drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c |  17 +--
>   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c   |  15 +-
>   drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c   |   2 +-
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_blk.c    |   2 +-
>   .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c    |  75 +++++++++-
>   .../drm/msm/disp/dpu1/dpu_hw_catalog_format.h |  88 ------------
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c     |   2 +-
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c   |   4 +-
>   drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c     |  19 ++-
>   drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c        |   5 +-
>   drivers/gpu/drm/msm/disp/dpu1/dpu_vbif.c      |   2 +-
>   drivers/gpu/drm/msm/msm_drv.c                 |   4 +-
>   .../gpu/drm/nouveau/nvkm/subdev/bios/init.c   | 136 +++++++++---------
>   drivers/gpu/drm/radeon/radeon_device.c        |   1 +
>   37 files changed, 277 insertions(+), 268 deletions(-)
>   delete mode 100644 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog_format.h
>
> Cc: Alex Deucher <alexander.deucher@amd.com>
> Cc: amd-gfx@lists.freedesktop.org
> Cc: Ben Skeggs <bskeggs@redhat.com>
> Cc: "Christian König" <christian.koenig@amd.com>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: David Airlie <airlied@linux.ie>
> Cc: Drew Davenport <ddavenport@chromium.org>
> Cc: dri-devel@lists.freedesktop.org
> Cc: freedreno@lists.freedesktop.org
> Cc: Fritz Koenig <frkoenig@google.com>
> Cc: Hawking Zhang <Hawking.Zhang@amd.com>
> Cc: Huang Rui <ray.huang@amd.com>
> Cc: Jerome Glisse <glisse@freedesktop.org>
> Cc: Jiansong Chen <Jiansong.Chen@amd.com>
> Cc: Jonathan Marek <jonathan@marek.ca>
> Cc: Kalyan Thota <kalyan_t@codeaurora.org>
> Cc: Likun Gao <Likun.Gao@amd.com>
> Cc: linaro-mm-sig@lists.linaro.org
> Cc: linux-arm-msm@vger.kernel.org
> Cc: linux-media@vger.kernel.org
> Cc: Luben Tuikov <luben.tuikov@amd.com>
> Cc: nouveau@lists.freedesktop.org
> Cc: Qinglang Miao <miaoqinglang@huawei.com>
> Cc: Rob Clark <robdclark@gmail.com>
> Cc: Sean Paul <sean@poorly.run>
> Cc: Sonny Jiang <sonny.jiang@amd.com>
> Cc: Sumit Semwal <sumit.semwal@linaro.org>
> Cc: Tao Zhou <tao.zhou1@amd.com>

