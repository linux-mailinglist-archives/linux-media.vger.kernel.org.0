Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E98E43624A0
	for <lists+linux-media@lfdr.de>; Fri, 16 Apr 2021 17:55:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237592AbhDPPys (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 16 Apr 2021 11:54:48 -0400
Received: from mail-bn8nam08on2077.outbound.protection.outlook.com ([40.107.100.77]:51307
        "EHLO NAM04-BN8-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S236696AbhDPPyi (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 16 Apr 2021 11:54:38 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Rj2syLTSmA2B/5Dlv0DxgYh3fLkLx5b96ApvD/xWLppg/TJqKYl1eR5WO/bXk/AFfphCA6v/9TL+vugVW4dYIgXZ6t1oejnYXS8ogQuyFCJeHbXlYqnkhOArJVvMzOaMxVPdP/h9yF0D1QeL1EjDkxBKcxgtE0T0XLoFwiyiKJQwx94/Rp5p+sFANwZCzolia0fHgY8ZAsKpDskIIobjyDmKy0Bg+eieuseUqgrnsd6/oG3ICxy526QsH/joI9StavSJtoh/ILT9PQfIAjDmB8e8Kk34jRwvmKG/cEYdFJr0vjHGtb1fVG0B1B9NlNHNDkHDiJfBYz719sWPwCFcdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XeTyYgDsRHam85sy8LLI25y8/t2GnLjOuFQ49B2dPfY=;
 b=gwRynA2Snortg7gLOvWc0IciqbR8NTTEbkMCokgamKSVrCnIGCpipiGReuSb3bXvRA0nnTT4Kfj1oPQ8txp8iafmf7AtA4OXDo+bPN0EAse1RUDUY7KmA6whcLfsCFueHLJIdy34Nhf5x206y4BxGHteXVhds1i7CDOJf2Mn+DeFvNJKgHVsRvHk+OArUNlB7+zCvp4vitQNxfwMbzo+Mc2l7Rvwp9aQy62tg+b7cF34Ce1LMCa14MZIq9IhrOugawW/gmKBOr18pefGOWPdKIJm4JSD7ZEvBgVfkBxXUgLVhZkgox9uEJN0VCwat3VTcbnlLMPchNe9mO8iKk0w/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XeTyYgDsRHam85sy8LLI25y8/t2GnLjOuFQ49B2dPfY=;
 b=ZKH+yS6WPa6zyQkgPs2vNVfqRFFjeTFNolF3eiuzGjfu6Hbj8lTQgKDorR6WckHH9D3SImJRjfM+lNNDq2DP9u71LLVVg1l01uOT6wETC7dMRBYfUokacqEmS+1kjOkssXdRIUbG9eQj0vOcd7vao7cY16GCH8hDl4mYsk/b+C0=
Authentication-Results: lists.linaro.org; dkim=none (message not signed)
 header.d=none;lists.linaro.org; dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by MN2PR12MB3696.namprd12.prod.outlook.com (2603:10b6:208:169::27) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4042.16; Fri, 16 Apr
 2021 15:54:12 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::6d4d:4674:1cf6:8d34]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::6d4d:4674:1cf6:8d34%6]) with mapi id 15.20.4020.025; Fri, 16 Apr 2021
 15:54:12 +0000
Subject: Re: [PATCH 33/40] drm/amd/amdgpu/amdgpu_ring: Provide description for
 'sched_score'
To:     Lee Jones <lee.jones@linaro.org>
Cc:     linux-kernel@vger.kernel.org,
        Alex Deucher <alexander.deucher@amd.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
        linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org
References: <20210416143725.2769053-1-lee.jones@linaro.org>
 <20210416143725.2769053-34-lee.jones@linaro.org>
From:   =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <d44d2325-4cba-2927-d5e9-1d8e0ab1649c@amd.com>
Date:   Fri, 16 Apr 2021 17:54:06 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
In-Reply-To: <20210416143725.2769053-34-lee.jones@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Originating-IP: [2a02:908:1252:fb60:5d8d:1198:63ca:8fe4]
X-ClientProxiedBy: AM3PR03CA0067.eurprd03.prod.outlook.com
 (2603:10a6:207:5::25) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:5d8d:1198:63ca:8fe4] (2a02:908:1252:fb60:5d8d:1198:63ca:8fe4) by AM3PR03CA0067.eurprd03.prod.outlook.com (2603:10a6:207:5::25) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4042.17 via Frontend Transport; Fri, 16 Apr 2021 15:54:10 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2dcf1860-9c4b-4fa1-31b9-08d900efe0f0
X-MS-TrafficTypeDiagnostic: MN2PR12MB3696:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MN2PR12MB3696524479D26C0A9F43FFF0834C9@MN2PR12MB3696.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5797;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: py2A7gfvmXIQMYlKkt0Y9LjRPlXOR+UZFGtNsvdrAVDXZJPWIcWYdeEUHC2u6ga3bhcgyt43pIRapzn/Ebkv7kH2/9Q1Kv4T+7bOy5OmgrHsomGv/LJXBGG9ukw0ws2PUTwSLUNZs3gnMJH/8TiEieeYlk/wY/U+ttEQMaPT7jZ8aS16srkTPEOuUbbi4ezJVCPmkozxuUSD0YpT6uFrfqy4+YJ/d3aZAoUR6XYIA2ZzzxgWL24wahk5wPY4PJh3zqXWSlNZLMGx3Md2/YKJejgE9hne9/tFsQBp0md7FlX5qfkwnwqB1kb2nqSuO3ccL9gGJpRelvDWK0Hkeb3iciXOjLqorBP+IzfYhGXgXNK86TybyWK/8dEua01wtUUMJAigLiAefMp2s3pEaHit8e4lsw523D+e338q+AccSSv1mxzLnMFURApoa+nVGA8342hZzn4MrZkTje2v5Jwgmp+TwWDPtmFdfW7WnsSFYD2iTxftkQReTA6SXr4xFGdKXhvbqpTWWQr9V0T+F5lBO1uEL7btg4bw6Ec50tponpSLwAUxaWnsm5E7s/qd3uiHildQrzAtGao+y+qUcKWzByH62APlgGRukeWq+2H/RRqQK0f6egziBn9YIlrzxwwWoPeBr3j011KOxaBE3PajES2jyJadAxYjp2i0D/N+35uRJ5lCgP5jg/fLOW3qW+o4
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN2PR12MB3775.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(376002)(136003)(366004)(346002)(39860400002)(5660300002)(31696002)(478600001)(4326008)(8936002)(86362001)(66476007)(66574015)(66946007)(66556008)(6666004)(31686004)(2616005)(6486002)(2906002)(54906003)(186003)(16526019)(316002)(8676002)(6916009)(52116002)(36756003)(83380400001)(38100700002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?NTFjaDNPVjF5SFo5MTVuUitpbkdVMjJvQUxSRHZScGduTG9Oakh6MWtYamVY?=
 =?utf-8?B?VE93cUdSUmhjaGs0UTZQVDNGSEpuSm9oaVl6T09ycHQ5WVAyVERSOEt0ZzNo?=
 =?utf-8?B?UHNiZWhYQ1FoUzhSRy8rQVN4YVh5R1J0c0N0RW1TTWxiU2p4ZXhqNWgxdlRI?=
 =?utf-8?B?L1JpUm5UVjduajRDM1d5THNOWVJZRTk1eUxXamhoNVhaSmNoeU1XTEZtSjNJ?=
 =?utf-8?B?QjRVazQ3SWdaVE0zejZZV3hmU3pIZ0hkdzkveFI5NU5IaVhJN3Nad1BvWEh6?=
 =?utf-8?B?eUwrV3hBT21YRVdJcnM5VUhLaEJIaUpLZktXUjY3a3VZQ3NjcDJRU2NhWWpv?=
 =?utf-8?B?a1BrQlJHTVRTR0ZCTHIwN1lPY05ESmZYbUlWTlhwelhsdVVZTGZIYm4ranBN?=
 =?utf-8?B?enlzTVg3amFsVkFRNTBzL095TWZVRDdkbncwZGZncXBUZnJHKy9YaG5JdEkw?=
 =?utf-8?B?WXdNZndCb1piQ2E4UTJtOUY1RHVIb3RWbE1qL0RZWWxic3NuZVBpaEx6MGVa?=
 =?utf-8?B?NnZFV0F6SzJqc3d1QjRuMENTYkJ1c2RjVjJzTWV4eXR5U1BQNzBRb1gvdFhn?=
 =?utf-8?B?dFY2di9NMDBjS0VRandzT1J1bExvS3RuZ00vVjk0aDlUME0yN0dldHJWdjVY?=
 =?utf-8?B?L2tIcGM0ME1JVlhqNUJZdjlxendJUTh4M3lRZzJWdk5jMmlraE5EbTF6dU5C?=
 =?utf-8?B?U1FRYUFobm56VEpKWDZ0aHJqT0tQTnpaUFQwRXg3YWZSVWJPOHJrbzlTVGtZ?=
 =?utf-8?B?WjJZWElJZk1sRnc4YzdJcnVHV0pYc1ZKYUMwUSs5NVh2WjJNcmUzMHFuRFRC?=
 =?utf-8?B?QzFGZ01WYU02RDNyN3VuT0dJMkpKbGtjTFk2L2JONjhva2FLM2oycEw0NmpC?=
 =?utf-8?B?STZhN1BMMW1Hbi9UN0xPcTN0cnc5ekRwc1ZSaTI4SnI1b0FiWEtrRGhDZm1H?=
 =?utf-8?B?R2ZPSGVaOGdrVW5jb1c3WXpBYTk0elZGeDNGUWt2YmFGTUFVVXp2VlhOR2dN?=
 =?utf-8?B?eDBuazAyQmtYNGlUdmptUE9ITHh4MlZKS1VVN3dHRWl5bWZJanFERDNuemZt?=
 =?utf-8?B?NGY3N3ZOY0YyK09kQ1RzVWFwOTN4WGhWSUlHbjhQKzI5T21jWWVlbHorc0p4?=
 =?utf-8?B?Wk1jRmU2OVdwOFRsZGtPZ2srNEFPQTBnOWM4Qk50bUR6dmdZT21hcFdnZjRs?=
 =?utf-8?B?aEozTDRTZUV5S0hKSW1HMlV5TDdLSGpxemQrT0RaZFdlRThXU3IxSG1WV29G?=
 =?utf-8?B?bXRIMzdEbFRtVFhjZGl4WjdEWW1DY0IvNitIdXlBR1hGamUvWTRaWVRtSmhP?=
 =?utf-8?B?a0hkeURjN3M2ZGN4MFAxQnNpZXVZQjRSQkkzT2JVWUN1RkcvbEdLK2EyeHlQ?=
 =?utf-8?B?K2NXUTAxZ2kwQVNZN2R0dzZaSFVDMWJYWmwzd3djK3ZTL0RQU1hyS05ickta?=
 =?utf-8?B?aEJIdHdud1pwWHNQS2FscXNIVFBHbjljWDN0RHdmUWZkQk40U0tkbGRqSm9v?=
 =?utf-8?B?ejVsR0NlVDNXV2NpTDBpUmxqa0hoRE4vN2tOc0xKS2VMc2FiYXd1cGZuallR?=
 =?utf-8?B?N0NoRW5ieEZOVFgxM2pNemdUUTRjVVgxT251TnhVTm9LT0ZkUlJNbEFqbFRk?=
 =?utf-8?B?Y1NQUXovRlZyQWJrY250Mi9pc2xnd3U2MzhqVVpmajQrc0RxK0M4MThScGor?=
 =?utf-8?B?VVp0N1N2M1ppMzh3UnQ0RzNZSENMelNidG9xa214OGZRaExzb2pJMWJPdVNV?=
 =?utf-8?B?NUQzdmh4ZEIvaGNlVnZveklqMEtidHFzTE9BRDkxOElHUnQySVVLRjNpUERk?=
 =?utf-8?B?UkxwOFNBYjVqeXByRm91WHcrMWJUUFhjUDhveVl2ZHRXT3g0NWVZZVJmeHlN?=
 =?utf-8?Q?qkCf3sVipUkZq?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2dcf1860-9c4b-4fa1-31b9-08d900efe0f0
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Apr 2021 15:54:12.2406
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Q0kkWAIbk8vtPpR1e361eyCLxEE70HKIIVQlsJISUX0tkbOv26YjEjT3v46twN6U
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3696
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Am 16.04.21 um 16:37 schrieb Lee Jones:
> Fixes the following W=1 kernel build warning(s):
>
>   drivers/gpu/drm/amd/amdgpu/amdgpu_ring.c:169: warning: Function parameter or member 'sched_score' not described in 'amdgpu_ring_init'
>
> Cc: Alex Deucher <alexander.deucher@amd.com>
> Cc: "Christian König" <christian.koenig@amd.com>
> Cc: David Airlie <airlied@linux.ie>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: Sumit Semwal <sumit.semwal@linaro.org>
> Cc: amd-gfx@lists.freedesktop.org
> Cc: dri-devel@lists.freedesktop.org
> Cc: linux-media@vger.kernel.org
> Cc: linaro-mm-sig@lists.linaro.org
> Signed-off-by: Lee Jones <lee.jones@linaro.org>

Reviewed-by: Christian König <christian.koenig@amd.com>

> ---
>   drivers/gpu/drm/amd/amdgpu/amdgpu_ring.c | 1 +
>   1 file changed, 1 insertion(+)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ring.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ring.c
> index 688624ebe4211..7b634a1517f9c 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ring.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ring.c
> @@ -158,6 +158,7 @@ void amdgpu_ring_undo(struct amdgpu_ring *ring)
>    * @irq_src: interrupt source to use for this ring
>    * @irq_type: interrupt type to use for this ring
>    * @hw_prio: ring priority (NORMAL/HIGH)
> + * @sched_score: optional score atomic shared with other schedulers
>    *
>    * Initialize the driver information for the selected ring (all asics).
>    * Returns 0 on success, error on failure.

