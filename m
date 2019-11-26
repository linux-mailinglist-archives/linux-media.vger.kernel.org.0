Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 18EE010A09A
	for <lists+linux-media@lfdr.de>; Tue, 26 Nov 2019 15:44:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727807AbfKZOob (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 26 Nov 2019 09:44:31 -0500
Received: from mga09.intel.com ([134.134.136.24]:45735 "EHLO mga09.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727709AbfKZOoa (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 26 Nov 2019 09:44:30 -0500
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 26 Nov 2019 06:44:30 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,246,1571727600"; 
   d="scan'208";a="260713664"
Received: from rosenbaf-mobl1.ger.corp.intel.com (HELO [10.252.49.190]) ([10.252.49.190])
  by FMSMGA003.fm.intel.com with ESMTP; 26 Nov 2019 06:44:27 -0800
Subject: Re: [PATCH] udmabuf: Remove deleted map/unmap handlers.
To:     Daniel Vetter <daniel@ffwll.ch>
Cc:     dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
        Daniel Vetter <daniel.vetter@intel.com>,
        linux-media@vger.kernel.org
References: <20191126142516.630200-1-maarten.lankhorst@linux.intel.com>
 <20191126143633.GX29965@phenom.ffwll.local>
From:   Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Message-ID: <1ea4c2e0-38f6-6dfa-0fc1-5c6b6be9ed98@linux.intel.com>
Date:   Tue, 26 Nov 2019 15:44:27 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191126143633.GX29965@phenom.ffwll.local>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Op 26-11-2019 om 15:36 schreef Daniel Vetter:
> On Tue, Nov 26, 2019 at 03:25:16PM +0100, Maarten Lankhorst wrote:
>> Commit 7f0de8d80816 ("dma-buf: Drop dma_buf_k(un)map") removed map/unmap
>> handlers, but they still existed in udmabuf. Remove them there as well
>>
>> Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
>> Fixes: 7f0de8d80816 ("dma-buf: Drop dma_buf_k(un)map")
>> Cc: Sumit Semwal <sumit.semwal@linaro.org>
>> Cc: Daniel Vetter <daniel.vetter@intel.com>
>> Cc: linux-media@vger.kernel.org
>> Cc: linaro-mm-sig@lists.linaro.org
>> Cc: dri-devel@lists.freedesktop.org
> /me puts on brown paper bag
>
> Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
Thanks, pushed. :)
