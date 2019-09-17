Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C29A9B4889
	for <lists+linux-media@lfdr.de>; Tue, 17 Sep 2019 09:52:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404517AbfIQHwD (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 17 Sep 2019 03:52:03 -0400
Received: from ns.iliad.fr ([212.27.33.1]:42340 "EHLO ns.iliad.fr"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727479AbfIQHwD (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 17 Sep 2019 03:52:03 -0400
Received: from ns.iliad.fr (localhost [127.0.0.1])
        by ns.iliad.fr (Postfix) with ESMTP id 1AC8520315;
        Tue, 17 Sep 2019 09:52:02 +0200 (CEST)
Received: from [192.168.108.37] (freebox.vlq16.iliad.fr [213.36.7.13])
        by ns.iliad.fr (Postfix) with ESMTP id 70E3A1FF84;
        Tue, 17 Sep 2019 09:52:01 +0200 (CEST)
Subject: Re: [PATCH] media: v4l: cadence: Fix how unsued lanes are handled in
 'csi2rx_start()'
To:     Christophe JAILLET <christophe.jaillet@wanadoo.fr>
References: <20190912204450.17625-1-christophe.jaillet@wanadoo.fr>
Cc:     linux-media <linux-media@vger.kernel.org>
From:   Marc Gonzalez <marc.w.gonzalez@free.fr>
Message-ID: <c1a7e025-c3c7-9648-1ba9-c3f5469ac23d@free.fr>
Date:   Tue, 17 Sep 2019 09:52:01 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190912204450.17625-1-christophe.jaillet@wanadoo.fr>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: ClamAV using ClamSMTP ; ns.iliad.fr ; Tue Sep 17 09:52:02 2019 +0200 (CEST)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 12/09/2019 22:44, Christophe JAILLET wrote:

> Subject: [PATCH] media: v4l: cadence: Fix how unsued lanes are handled in 'csi2rx_start()'

s/unsued/unused

> The 2nd parameter of 'find_first_zero_bit()' is a number of bits, not of
> bytes. So use 'BITS_PER_LONG' instead of 'sizeof(lanes_used)'.
> 
> Fixes: 1fc3b37f34f6 ("media: v4l: cadence: Add Cadence MIPI-CSI2 RX driver")
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
