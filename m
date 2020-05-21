Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 55F4F1DCDD7
	for <lists+linux-media@lfdr.de>; Thu, 21 May 2020 15:20:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729197AbgEUNUX (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 21 May 2020 09:20:23 -0400
Received: from mail-eopbgr680043.outbound.protection.outlook.com ([40.107.68.43]:60486
        "EHLO NAM04-BN3-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1728159AbgEUNUW (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 21 May 2020 09:20:22 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=J4Ioe24dA0JcMz/Hc3EOIXJs9njE2chvQFKUVgMQnXsn4hjkcmKWrvf8tcMqjfZot7sDP9N2loQ5wFf+G2IhlAJpzgukVdli9oQKBPvfDLbYDJ+ho5EAcOedzkoiLk8sWfcKYaScNAs7mohfs4n+MB72QqlMDHz9GPxkJF/o95xHG32n3t22CTNLXGk2BKbs9Qjm02hwUY3JBjGIzLcI40y4W1V3nTGymAJMvpYBAbD/tbfVpvUALz4Y6ObnO/yi55mbcawGSeOFElh5YgFMf3vE0CBGin841tnWrKQA5jfQ9QtRx4S6FG2WI/VTbmHB2ErVAHR0zXP3EbUYW1pI4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3r4c/u0nJGhzzb0cOlJh0h+Tb3+zMkcxNcqhrS8GFRw=;
 b=OV2TsWt/dR6syYxuCoWBQg1xF94fnfn4rnfGkJj19Mo5gNL10ltwDQ4WRc+jyKY1BhCE+xUaP9YbJ650zaw8n0bL6+FVhGXENvL/kzFVmBeGE3rCgbw2SgQZBBaObkZeuJPIqJqLCbm4W3fhh+LidUuSJ9KjA+TMDkMC7104jT9VDi7/cGaTOIDRx9PG1EIK9DY22VaA/auGk8S+Qfdom4p3FFBtY7uuRhB9ubYj0d+ev9fuoTUXViEjmZkQIfIDxLUBtt7IK6YkB7K4ZKESt0ycafzosc3PkQG38ycf7R44FPFbhLzQDJY3TY5dvfhjZwou099HnAmtghFtAjAW6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3r4c/u0nJGhzzb0cOlJh0h+Tb3+zMkcxNcqhrS8GFRw=;
 b=hqv9O0ZqSZyvSc8lZwHb+8eSN8uJr+Hvlngvv1R8SmmVTaIC5qUwnTs3+xLR7ufo9mb4EF3Tv33nu6/4i4S6d+dwarkUy/6SIA/+tFwGeNEMs9tl2s4RgH5gOurTecD4Mw4dD4bb8oYyYOkyrTVUtTN/uTH1TKI/HOv+vMOvGbk=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none header.from=amd.com;
Received: from DM6PR12MB4401.namprd12.prod.outlook.com (2603:10b6:5:2a9::15)
 by DM6PR12MB4139.namprd12.prod.outlook.com (2603:10b6:5:214::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3021.23; Thu, 21 May
 2020 13:20:19 +0000
Received: from DM6PR12MB4401.namprd12.prod.outlook.com
 ([fe80::7949:b580:a2d5:f766]) by DM6PR12MB4401.namprd12.prod.outlook.com
 ([fe80::7949:b580:a2d5:f766%3]) with mapi id 15.20.3021.020; Thu, 21 May 2020
 13:20:19 +0000
Subject: Re: [PATCH v1 13/25] dma-buf: Use sequence counter with associated
 wound/wait mutex
To:     "Ahmed S. Darwish" <a.darwish@linutronix.de>,
        =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Cc:     Peter Zijlstra <peterz@infradead.org>,
        Ingo Molnar <mingo@redhat.com>, Will Deacon <will@kernel.org>,
        "David (ChunMing) Zhou" <David1.Zhou@amd.com>,
        amd-gfx@lists.freedesktop.org,
        "Paul E. McKenney" <paulmck@kernel.org>,
        David Airlie <airlied@linux.ie>,
        "Sebastian A. Siewior" <bigeasy@linutronix.de>,
        LKML <linux-kernel@vger.kernel.org>,
        Steven Rostedt <rostedt@goodmis.org>,
        dri-devel@lists.freedesktop.org, Daniel Vetter <daniel@ffwll.ch>,
        Alex Deucher <alexander.deucher@amd.com>,
        Felix Kuehling <Felix.Kuehling@amd.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        linux-media@vger.kernel.org
References: <20200519214547.352050-1-a.darwish@linutronix.de>
 <20200519214547.352050-14-a.darwish@linutronix.de>
 <e28c251e-5771-598c-37dd-c6be2de4b9e1@gmail.com>
 <20200521000930.GA359643@debian-buster-darwi.lab.linutronix.de>
From:   =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <cfde5db9-2b05-52df-4f88-1928779db669@amd.com>
Date:   Thu, 21 May 2020 15:20:04 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
In-Reply-To: <20200521000930.GA359643@debian-buster-darwi.lab.linutronix.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-ClientProxiedBy: FR2P281CA0026.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:14::13) To DM6PR12MB4401.namprd12.prod.outlook.com
 (2603:10b6:5:2a9::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7] (2a02:908:1252:fb60:be8a:bd56:1f94:86e7) by FR2P281CA0026.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:14::13) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3021.24 via Frontend Transport; Thu, 21 May 2020 13:20:11 +0000
X-Originating-IP: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: ed5e00d8-ae0e-4154-8b1b-08d7fd89b505
X-MS-TrafficTypeDiagnostic: DM6PR12MB4139:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR12MB41398F7161EA0E006681D40A83B70@DM6PR12MB4139.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-Forefront-PRVS: 041032FF37
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: gEL0NUeUWJfNg9FPTJuUTJY5TP9DmXyc65UYhlyTVon6IJYUzMeHJWU/6av3Xj4DARwotBufJtpb/BM1DZN7Ky9eFEdBdxRXlr4DM8franPl0Do+ye5ieCH3ixtbD6BmCSjIS3KnxJX+7SAnatZRl/9AlWTmJLGS8kYZ281iLKnTl9YAj+7UnILX/5V749OomYnsuQUvsauVDHeFDymIGDrO5aiAamN9W6nRP/jQI1xK6KJ33ZrUTAnTLlGM6zmVkpqvMaY9YDJxzV8GKQJniCYAqEOX5BXN01SUWmlsxkmJy5d2VAdJl/AeL8IJ0j9+mdONl/aVdtPtQ0FbexkjHY+wWyu+/ce9ca+bqh6ctlCFvp0LHmN0TYk/OUulVAjl
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR12MB4401.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(376002)(136003)(366004)(39860400002)(346002)(396003)(7416002)(2616005)(186003)(6666004)(5660300002)(31686004)(66556008)(66946007)(66574014)(66476007)(36756003)(478600001)(8936002)(2906002)(16526019)(6486002)(8676002)(316002)(110136005)(4326008)(86362001)(31696002)(54906003)(52116002)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: B46FXa2FCEaz+dG67toXIgVNuSsaLcpscjHId66nMMlW47umexbk1+N8e/SI7IGgOzntViF6BSRiSOR/4cFF+eypQ60qbVRrkeIJXS+vmTcP5hSFV72mvI1EPPlqK77kU2B0B83yoHrXASNLh8wPX7g1Q8zAXVFqlb7Nx9U29zVDoCkQdPVie7D859C0POY6Nttd8SMy8dOSCCqmUic/aPu0shJP5JdgUMx0n0M1yWg15OTxBJZY7FsVL/NY8HqCAdT3QLuq464PvzJs92JcQ9eTnj9XUv7CALLNPvKy5cAqhbB8plMZmQNBR25R9VV6TZUH+ytFeKyYvTLZ6wScQLqfG9eXmKZMZt+9/wNpZh76Al6pJ7MyWjYxID5zhAwYiKNypF/cG+Ktks1fWjgG6xbq//+3UetwWrChZJe+7FKlF+Cl0fgNszLCK5FhIziSl8Z93Noj2reGfZri6XC79CbpkdaV12Kj0JvK+6E07Yr2EQurMbdMJUNrGPKmWXi8+akteByoGMcAWvYaFk9ssnPrzoRM/+3R4Ka6k8tbSFsywZMkL2Lcwjt29EuRcfCc
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ed5e00d8-ae0e-4154-8b1b-08d7fd89b505
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 May 2020 13:20:18.8667
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /Ob6VJAffOdCyKSe3wkyrTxBr7MfV0pbv/MwlM6ukBm4ugF0xih2Wn/LaFNVRMQW
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4139
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Am 21.05.20 um 02:09 schrieb Ahmed S. Darwish:
> On Wed, May 20, 2020, Christian König wrote:
>> Am 19.05.20 um 23:45 schrieb Ahmed S. Darwish:
>>> A sequence counter write side critical section must be protected by some
>>> form of locking to serialize writers. If the serialization primitive is
>>> not disabling preemption implicitly, preemption has to be explicitly
>>> disabled before entering the sequence counter write side critical
>>> section.
>>>
>>> The dma-buf reservation subsystem uses plain sequence counters to manage
>>> updates to reservations. Writer serialization is accomplished through a
>>> wound/wait mutex.
>>>
>>> Acquiring a wound/wait mutex does not disable preemption, so this needs
>>> to be done manually before and after the write side critical section.
>>>
>>> Use the newly-added seqcount_ww_mutex_t instead:
>>>
>>>     - It associates the ww_mutex with the sequence count, which enables
>>>       lockdep to validate that the write side critical section is properly
>>>       serialized.
>>>
>>>     - It removes the need to explicitly add preempt_disable/enable()
>>>       around the write side critical section because the write_begin/end()
>>>       functions for this new data type automatically do this.
>>>
>>> If lockdep is disabled this ww_mutex lock association is compiled out
>>> and has neither storage size nor runtime overhead.
>> Mhm, is the dma_resv object the only user of this new seqcount_ww_mutex
>> variant ?
>>
>> If yes we are trying to get rid of this sequence counter for quite some
>> time, so I would rather invest the additional time to finish this.
>>
> In this patch series, each extra "seqcount with associated lock" data
> type costs us, exactly:
>
>    - 1 typedef definition, seqcount_ww_mutex_t
>    - 1 static initializer, SEQCNT_WW_MUTEX_ZERO()
>    - 1 runtime initializer, seqcount_ww_mutex_init()
>
> Definitions for the typedef and the 2 initializers above are
> template-code one liners.

In this case I'm perfectly fine with this.

>
> The logic which automatically disables preemption upon entering a
> seqcount_ww_mutex_t write side critical section is also already shared
> with seqcount_mutex_t and any future, preemptible, associated lock.
>
> So, yes, dma-resv is the only user of seqcount_ww_mutex.
>
> But even in that case, given the one liner template code nature of
> seqcount_ww_mutex_t logic, it does not make sense to block the dma_resv
> and amdgpu change until at some point in the future the sequence counter
> is completely removed.
>
> **If and when** the sequence counter gets removed, please just remove
> the seqcount_ww_mutex_t data type with it. It will be extremely simple.

Completely agree, just wanted to prevent that we now add a lot of code 
which gets removed again ~3 month from now.

Regards,
Christian.

>
>> Regards,
>> Christian.
>>
> Thanks,
>
> --
> Ahmed S. Darwish
> Linutronix GmbH

