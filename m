Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 77DA81E027C
	for <lists+linux-media@lfdr.de>; Sun, 24 May 2020 21:28:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388329AbgEXT1Z (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 24 May 2020 15:27:25 -0400
Received: from mail.kernel.org ([198.145.29.99]:55946 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2387992AbgEXT1Y (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Sun, 24 May 2020 15:27:24 -0400
Received: from [192.168.0.50] (89-70-52-201.dynamic.chello.pl [89.70.52.201])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 1FEDD2075F;
        Sun, 24 May 2020 19:27:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1590348444;
        bh=FzOHq6c7QFOy1Q1Z7apPD+mOvKHo4MaeuHH98f8ZlGY=;
        h=Subject:From:To:Cc:References:Date:In-Reply-To:From;
        b=idep3C1p3bUspKEkJE9ZaG/Iyyx+xA2laeDujyI4XQGgtI/65qg8R1KQuPagXDGdP
         miAPl5OSeZrcqJK0V1wZtER5GGrnQefy/1rZIzU1QqY0xfimi2aJNCpulZschSvS8x
         OMvyuMEbgZiOcPc3swiHqO2vbjkNxKraXLiLwLGM=
Subject: Re: [PATCH V2] media: s3c-camif: fix missing disable in
 tegra_adma_probe().
From:   Sylwester Nawrocki <snawrocki@kernel.org>
To:     wu000273@umn.edu
Cc:     mchehab@kernel.org, linux-media@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
        kjlu@umn.edu
References: <20200524034616.31625-1-wu000273@umn.edu>
 <9b1cdd76-1fbf-c66b-a8e1-929ce2aba791@kernel.org>
Message-ID: <1c635607-b3b1-decc-a395-5d0464a59e17@kernel.org>
Date:   Sun, 24 May 2020 21:27:21 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <9b1cdd76-1fbf-c66b-a8e1-929ce2aba791@kernel.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 5/24/20 21:03, Sylwester Nawrocki wrote:
> On 5/24/20 05:46, wu000273@umn.edu wrote:
>> From: Qiushi Wu <wu000273@umn.edu>
>>
>> "pm_runtime_enable()" was not handled by "pm_runtime_disable()"
>> after a call of the function “pm_runtime_get_sync()” failed.
>> Thus move the jump target “err_pm” before calling function
>> "calling pm_runtime_disable()".
>>
>> Fixes: babde1c243b2 ("[media] V4L: Add driver for S3C24XX/S3C64XX SoC 
>> series camera interface")
>> Signed-off-by: Qiushi Wu <wu000273@umn.edu>
>> ---
>>
>> V2: improving commit messages.
> 
> Thanks for the patch. It seems you have got typo in the subject line.
> With tegra_adma_probe changed to s3c_camif_probe feel free to add:
> 
> Reviewed-by: Sylwester Nawrocki <s.nawrocki@samsung.com>

I just noticed this patch https://patchwork.linuxtv.org/patch/63976
which includes your fix and handles one more issue. Thus it might be
better to apply the patch from Dinghao Liu instead.
