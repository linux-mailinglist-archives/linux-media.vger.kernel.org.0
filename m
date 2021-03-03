Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0807F32C7A9
	for <lists+linux-media@lfdr.de>; Thu,  4 Mar 2021 02:11:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1380616AbhCDAc0 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 3 Mar 2021 19:32:26 -0500
Received: from pio-pvt-msa2.bahnhof.se ([79.136.2.41]:56004 "EHLO
        pio-pvt-msa2.bahnhof.se" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244083AbhCCTV1 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 3 Mar 2021 14:21:27 -0500
Received: from localhost (localhost [127.0.0.1])
        by pio-pvt-msa2.bahnhof.se (Postfix) with ESMTP id DE02B3F4D9;
        Wed,  3 Mar 2021 20:07:56 +0100 (CET)
Authentication-Results: pio-pvt-msa2.bahnhof.se;
        dkim=pass (1024-bit key; unprotected) header.d=shipmail.org header.i=@shipmail.org header.b=K3jxx52L;
        dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at bahnhof.se
X-Spam-Flag: NO
X-Spam-Score: -2.449
X-Spam-Level: 
X-Spam-Status: No, score=-2.449 tagged_above=-999 required=6.31
        tests=[BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
        DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.35,
        URIBL_BLOCKED=0.001] autolearn=ham autolearn_force=no
Received: from pio-pvt-msa2.bahnhof.se ([127.0.0.1])
        by localhost (pio-pvt-msa2.bahnhof.se [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id WWAsjB0nZGID; Wed,  3 Mar 2021 20:07:55 +0100 (CET)
Received: by pio-pvt-msa2.bahnhof.se (Postfix) with ESMTPA id 8A7E93F2DC;
        Wed,  3 Mar 2021 20:07:53 +0100 (CET)
Received: from [192.168.0.209] (h-205-35.A357.priv.bahnhof.se [155.4.205.35])
        by mail1.shipmail.org (Postfix) with ESMTPSA id ED2D1360057;
        Wed,  3 Mar 2021 20:07:52 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=shipmail.org; s=mail;
        t=1614798473; bh=nKupVD6Xba+2uKQHTUnVnHc3sylFOHvp30xUyrZ7/AU=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=K3jxx52L2803o5MEVtLNblLXmNDqm9f9fB2aegV1Y5Y3ayfcYcOPumRfxAqWSqA4T
         HLnvLLZzf3rQq74nnomUpdnh2f0sTSKk6VYVaOF5T+Zb26ZifxmuVF/6EOOJrKLj62
         dbS6RKPwjMoGEgPlfRiLXT6LrtC/dIbqiBLzZ2Mk=
Subject: Re: [Linaro-mm-sig] [PATCH] dma-fence: Document recoverable page
 fault implications
To:     Daniel Vetter <daniel.vetter@ffwll.ch>,
        DRI Development <dri-devel@lists.freedesktop.org>
Cc:     Felix Kuehling <felix.kuehling@amd.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        linaro-mm-sig@lists.linaro.org, Jerome Glisse <jglisse@redhat.com>,
        =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@intel.com>,
        Daniel Vetter <daniel.vetter@intel.com>,
        =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
        linux-media@vger.kernel.org
References: <20210203152921.2429937-1-daniel.vetter@ffwll.ch>
From:   =?UTF-8?Q?Thomas_Hellstr=c3=b6m_=28Intel=29?= 
        <thomas_os@shipmail.org>
Message-ID: <d285bb0a-a226-21d6-ab0f-922b566c7532@shipmail.org>
Date:   Wed, 3 Mar 2021 20:07:52 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210203152921.2429937-1-daniel.vetter@ffwll.ch>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


On 2/3/21 4:29 PM, Daniel Vetter wrote:
> Recently there was a fairly long thread about recoreable hardware page
> faults, how they can deadlock, and what to do about that.
>
> While the discussion is still fresh I figured good time to try and
> document the conclusions a bit. This documentation section explains
> what's the potential problem, and the remedies we've discussed,
> roughly ordered from best to worst.
>
> v2: Linus -> Linux typoe (Dave)
>
> v3:
> - Make it clear drivers only need to implement one option (Christian)
> - Make it clearer that implicit sync is out the window with exclusive
>    fences (Christian)
> - Add the fairly theoretical option of segementing the memory (either
>    statically or through dynamic checks at runtime for which piece of
>    memory is managed how) and explain why it's not a great idea (Felix)
>
> References: https://lore.kernel.org/dri-devel/20210107030127.20393-1-Felix.Kuehling@amd.com/
> Cc: Dave Airlie <airlied@gmail.com>
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Cc: Thomas Hellström <thomas.hellstrom@intel.com>
> Cc: "Christian König" <christian.koenig@amd.com>
> Cc: Jerome Glisse <jglisse@redhat.com>
> Cc: Felix Kuehling <felix.kuehling@amd.com>
> Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> Cc: Sumit Semwal <sumit.semwal@linaro.org>
> Cc: linux-media@vger.kernel.org
> Cc: linaro-mm-sig@lists.linaro.org
> ---
>   Documentation/driver-api/dma-buf.rst | 76 ++++++++++++++++++++++++++++
>   1 file changed, 76 insertions(+)
>
Acked-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>


