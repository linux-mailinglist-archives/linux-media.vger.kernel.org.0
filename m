Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6DEB13CF48F
	for <lists+linux-media@lfdr.de>; Tue, 20 Jul 2021 08:33:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242027AbhGTFxK (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 20 Jul 2021 01:53:10 -0400
Received: from cpanel.siel.si ([46.19.9.99]:41466 "EHLO cpanel.siel.si"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235574AbhGTFxH (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 20 Jul 2021 01:53:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=norik.com;
        s=default; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:
        Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:Content-ID:
        Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
        :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
        List-Post:List-Owner:List-Archive;
        bh=Kz7tffSGOWg80z7MjGUT2zUun0b92FP6KnOiD2Dl8OA=; b=Xs+3pOY1k7++Nb9aq6StmJ8ftL
        DP87EX2BpeG70zwVYh7zQ4FqnjIunvy3Pqpn3o6IljjzeBqfiuYIBZz8f/jYl+CC8qsou0+bIcmVL
        fx6sGUOn2z/HFNa3aldx6TK4Mh3JFgNPAOAeCfj7l4YqnLsr/SVGld9ftLRQ5dAEfZlCWNz3c393j
        ocBza+S09FAtuSoSt3BfPQ0NWgm33MJUO2y9VFmqftWpWKheXZaWMp7jOiZnFSRwda3JSyNTjc2Cp
        ZOs/uJd2J/bpykuV1DynFfwQFiVd+lMlPFtdsjqbZbOWjzWecPAw9kzlHONGGD+SBlkpahMA6Or4Z
        3VQWo7nQ==;
Received: from [89.212.21.243] (port=47086 helo=[192.168.69.215])
        by cpanel.siel.si with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
        (Exim 4.94.2)
        (envelope-from <andrej.picej@norik.com>)
        id 1m5jJt-00FSCC-Pp; Tue, 20 Jul 2021 08:33:41 +0200
Subject: Re: Problem with coda h264 decoder and different color formats
To:     Philipp Zabel <p.zabel@pengutronix.de>, linux-media@vger.kernel.org
Cc:     mchehab@kernel.org
References: <e07c752e-4029-6640-d462-811c82dd5109@norik.com>
 <e134ee8dc40aa1acbce2fb86779cd1dab82357c1.camel@pengutronix.de>
From:   Andrej Picej <andrej.picej@norik.com>
Message-ID: <f3f40e49-ba55-a6fe-5530-06a1fefe6295@norik.com>
Date:   Tue, 20 Jul 2021 08:33:43 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <e134ee8dc40aa1acbce2fb86779cd1dab82357c1.camel@pengutronix.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - cpanel.siel.si
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - norik.com
X-Get-Message-Sender-Via: cpanel.siel.si: authenticated_id: andrej.picej@norik.com
X-Authenticated-Sender: cpanel.siel.si: andrej.picej@norik.com
X-Source: 
X-Source-Args: 
X-Source-Dir: 
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Philipp,

thanks for your answer.

> Can you confirm this works with 4.19.100 with exactly the same coda
> firmware that shows the broken behavior on 5.10.50?

Yes, exactly the same coda firmware (3.1.1) with 4.19.100 and 5.10.50:> 
[   10.461672] coda 2040000.vpu: Firmware version: 3.1.1

> 
> I think the culprit is commit 497e6b8559a6 ("media: coda: add sequence
> initialization work"), which moves some initialization earlier before
> userspace selects the final capture format.
> During __coda_decoder_seq_init() (which prints the "start decoding:
> 1920x960" line above), the ctx->frame_mem_ctrl is set for the default
> NV12/tiled output format. This is never corrected when streaming
> actually starts.
> 
> Could you check if this patch [1] helps?
> 
> [1] https://lore.kernel.org/linux-media/20210719145708.10643-1-p.zabel@pengutronix.de/T/#u
> 

Yes, this patch solves the problem. I can now successfully play videos 
with all supported decoder color formats (NV12, I420, YV12 and YUY2). 
This also works in Qt app.

I can't thank you enough for your fast response. Thank you so much.

Best regards,
Andrej
