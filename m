Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A4D221E08F6
	for <lists+linux-media@lfdr.de>; Mon, 25 May 2020 10:38:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388375AbgEYIiL (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 25 May 2020 04:38:11 -0400
Received: from mail.kernel.org ([198.145.29.99]:41500 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2387973AbgEYIiK (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 25 May 2020 04:38:10 -0400
Received: from [192.168.0.50] (89-70-52-201.dynamic.chello.pl [89.70.52.201])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 79D292070A;
        Mon, 25 May 2020 08:38:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1590395890;
        bh=Iu3Bf6K8xAknpcdpi+/p3IjPL1Y2521MLs3/DHEjTLU=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=Ivm7FSYUh2nqsjE+OblssRVQFhjQhZGa3VSt8396z3VYi0wiK1zj7mAPXIJMXcuR8
         UVTL52rRVV9wpm1xhWmmPV9Ht4KgxcyKB4ybjIYrzTXalOCJHxFlZbTaASFYMiEwc6
         2Hakkt6Vaz6YqU2RCoDO0ENXRZ8y8w9ZRqtFUa3o=
Subject: Re: [PATCH] media: exynos4-is: Fix runtime PM imbalance in
 fimc_is_probe
To:     Dinghao Liu <dinghao.liu@zju.edu.cn>, kjlu@umn.edu
Cc:     Kyungmin Park <kyungmin.park@samsung.com>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Kukjin Kim <kgene@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20200524025903.17219-1-dinghao.liu@zju.edu.cn>
From:   Sylwester Nawrocki <snawrocki@kernel.org>
Message-ID: <7c5931a5-4355-be85-d61d-908afc8f7a19@kernel.org>
Date:   Mon, 25 May 2020 10:38:06 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200524025903.17219-1-dinghao.liu@zju.edu.cn>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 5/24/20 04:59, Dinghao Liu wrote:
> pm_runtime_get_sync() increments the runtime PM usage counter even
> when it returns an error code. Thus a pairing decrement is needed on
> the error handling path to keep the counter balanced. For all error
> paths after pm_runtime_get_sync(), things are the same.
> 
> Signed-off-by: Dinghao Liu <dinghao.liu@zju.edu.cn>

Reviewed-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
