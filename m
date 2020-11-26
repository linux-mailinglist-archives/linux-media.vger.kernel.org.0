Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 00F5C2C51F8
	for <lists+linux-media@lfdr.de>; Thu, 26 Nov 2020 11:26:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387887AbgKZK0D (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 26 Nov 2020 05:26:03 -0500
Received: from ns.iliad.fr ([212.27.33.1]:40544 "EHLO ns.iliad.fr"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1732480AbgKZK0C (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 26 Nov 2020 05:26:02 -0500
X-Greylist: delayed 302 seconds by postgrey-1.27 at vger.kernel.org; Thu, 26 Nov 2020 05:26:01 EST
Received: from ns.iliad.fr (localhost [127.0.0.1])
        by ns.iliad.fr (Postfix) with ESMTP id 0D1382078C;
        Thu, 26 Nov 2020 11:20:59 +0100 (CET)
Received: from [192.168.108.81] (freebox.vlq16.iliad.fr [213.36.7.13])
        by ns.iliad.fr (Postfix) with ESMTP id EA64920189;
        Thu, 26 Nov 2020 11:20:58 +0100 (CET)
Subject: Re: [PATCH 1/2] Revert "media: camss: Make use of V4L2_CAP_IO_MC"
To:     Andrey Konovalov <andrey.konovalov@linaro.org>, mchehab@kernel.org,
        robert.foss@linaro.org
Cc:     linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        peter.griffin@linaro.org
References: <20201125123710.28491-1-andrey.konovalov@linaro.org>
From:   Marc Gonzalez <marc.w.gonzalez@free.fr>
Message-ID: <2a0f255c-1e58-aacc-40ec-86aaca72f500@free.fr>
Date:   Thu, 26 Nov 2020 11:20:58 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201125123710.28491-1-andrey.konovalov@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: ClamAV using ClamSMTP ; ns.iliad.fr ; Thu Nov 26 11:20:59 2020 +0100 (CET)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 25/11/2020 13:37, Andrey Konovalov wrote:

> This reverts commit c90f1178dcac30dee5ddd29ec0513e7589aa866e.
> 
> The assumption of "Each entry in formats[] table has unique mbus_code"
> is valid for the RDI entities, but not for the PIX ones.
> 
> Reverting this patch and creating a new one which handles the PIX entities
> correctly results in smaller and more straitforward patch than doing the
> changes on top of the current version.


s/straitforward/straightforward  ;-)
