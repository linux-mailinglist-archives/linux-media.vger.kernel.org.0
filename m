Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 45CF1498520
	for <lists+linux-media@lfdr.de>; Mon, 24 Jan 2022 17:45:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243866AbiAXQpv (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 24 Jan 2022 11:45:51 -0500
Received: from pio-pvt-msa2.bahnhof.se ([79.136.2.41]:37390 "EHLO
        pio-pvt-msa2.bahnhof.se" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243869AbiAXQpq (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 24 Jan 2022 11:45:46 -0500
X-Greylist: delayed 534 seconds by postgrey-1.27 at vger.kernel.org; Mon, 24 Jan 2022 11:45:46 EST
Received: from localhost (localhost [127.0.0.1])
        by pio-pvt-msa2.bahnhof.se (Postfix) with ESMTP id DA99B3F779;
        Mon, 24 Jan 2022 17:36:48 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at bahnhof.se
X-Spam-Flag: NO
X-Spam-Score: -2.1
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 tagged_above=-999 required=6.31
        tests=[BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
        DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
        URIBL_BLOCKED=0.001] autolearn=ham autolearn_force=no
Authentication-Results: pio-pvt-msa2.bahnhof.se (amavisd-new);
        dkim=pass (1024-bit key) header.d=shipmail.org
Received: from pio-pvt-msa2.bahnhof.se ([127.0.0.1])
        by localhost (pio-pvt-msa2.bahnhof.se [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id uYTAKBUKXUZQ; Mon, 24 Jan 2022 17:36:47 +0100 (CET)
Received: by pio-pvt-msa2.bahnhof.se (Postfix) with ESMTPA id DFDB23F45B;
        Mon, 24 Jan 2022 17:36:46 +0100 (CET)
Received: from [192.168.0.209] (unknown [192.55.54.51])
        by mail1.shipmail.org (Postfix) with ESMTPSA id 1B052362A9F;
        Mon, 24 Jan 2022 17:36:41 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=shipmail.org; s=mail;
        t=1643042205; bh=2NvOG9ruAgT77ur+eNXXiR43raw200NGiViJak3xaIc=;
        h=Date:Subject:To:References:From:In-Reply-To:From;
        b=sHMUFf9NxMW1CR8IlVt0yFAjqRLFs3Rp3mkCHz4s1A/OwhxvHjTtie9RHBDUHgYiE
         4+n9juQqXTdi742MJJ8nlTIEtBLS6OVJlQ5FoW1jxcNquncNzVJ/HxMgBH4Rg2SNGh
         W3cuXEkVc6AhjAquNgQViTHmW70ns6Dd8IWPS8dw=
Message-ID: <cfdefdc5-bd4a-31e4-a0e2-fb02acf6d01f@shipmail.org>
Date:   Mon, 24 Jan 2022 17:36:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [Intel-gfx] [PATCH 06/11] dma-buf: warn about containers in
 dma_resv object
Content-Language: en-US
To:     =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>,
        thomas.hellstrom@linux.intel.com, sumit.semwal@linaro.org,
        gustavo@padovan.org, daniel.vetter@ffwll.ch, zackr@vmware.com,
        linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
        intel-gfx@lists.freedesktop.org
References: <20220124130328.2376-1-christian.koenig@amd.com>
 <20220124130328.2376-7-christian.koenig@amd.com>
From:   =?UTF-8?Q?Thomas_Hellstr=c3=b6m_=28Intel=29?= 
        <thomas_os@shipmail.org>
In-Reply-To: <20220124130328.2376-7-christian.koenig@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


On 1/24/22 14:03, Christian König wrote:
> Drivers should not add containers as shared fences to the dma_resv
> object, instead each fence should be added individually.
>
> Signed-off-by: Christian König <christian.koenig@amd.com>
> Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>

Reviewed-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>

Is there any indication that this triggers on existing drivers?

Thomas


