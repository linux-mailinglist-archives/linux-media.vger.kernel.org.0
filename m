Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5C5F32B2713
	for <lists+linux-media@lfdr.de>; Fri, 13 Nov 2020 22:36:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726727AbgKMVfX (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 13 Nov 2020 16:35:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41828 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726662AbgKMVfK (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 13 Nov 2020 16:35:10 -0500
Received: from mail-ed1-x541.google.com (mail-ed1-x541.google.com [IPv6:2a00:1450:4864:20::541])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3FE04C0613D1;
        Fri, 13 Nov 2020 13:35:09 -0800 (PST)
Received: by mail-ed1-x541.google.com with SMTP id t9so12460733edq.8;
        Fri, 13 Nov 2020 13:35:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=2cxwnj4lvvDa/xdNK2NIpsCOU23p/MBBEu1nguvpMQ0=;
        b=F+hAwde6UWUQieKq1xiGdYeuNKYbhgRlHsUS4ewujyr+ooWFcafZg0SGWK4Eug0KU5
         qwYCXXgFuKyir8p8JpwDRAa31Y9zkbnCA1AxlBKJbeG/mNV+h24kXXdXnvsCdwUyDeGe
         Ga7vUyszX49+tyaBj4u/3N6HaKeskkBqwNJgnI4npCrVs4yffLrT86byK9ZZ6QYi0E5r
         LS2/pvIBkEH7Fl3+hl3XHnUV77kkxTCY84ErHeqF/bVQSgFMiPMkx7oIJZAo8fN9yi8N
         EYmjKNLlKihLAwUxDgc4Fv7HcYrbuhBJ29xsEfaUv05vrQNMwVFlmyYqCLdWspwqCPuM
         B/gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=2cxwnj4lvvDa/xdNK2NIpsCOU23p/MBBEu1nguvpMQ0=;
        b=LWuXOt8kQ4cO7M9SR+8R5foiKfdGq5y1Vlqgz9gJuXaNlFX/opOyBobj/6HfcLi1t9
         Rum5EBjmgvqndKep5DCEIrhEtybUhDFmS63p4iZWAeb6fBP2aTlKUwI5pKjbKBucDLhJ
         IdRvA+foHeq8rnnW2iSE1ifMhGjfeBd9YoR8qvsNkF76xCjjvX+6o+OHMid1bA8l/ZQR
         OOp5JFONMmZk17DvfmrteMejo5MzxLrPNlZDxpPGiDub/t3Ob7w5P/jMIZJxL6GgnkbM
         rsejQgk1+NmGil80btwQOfGVYyTvAd78j8dVI6c4izlGAxXCndvWzHqE8N55LycA2+cX
         cusw==
X-Gm-Message-State: AOAM531gcfnNOAq1mfl+ZuCQdhT4ZwBpN2rddhiRTa7ZWKE2f4DAv6Cz
        7MVDa4Ovga7oUBcRB+J15BoOcS6vjXU=
X-Google-Smtp-Source: ABdhPJyzBG+Gw7PQ3NpEo5HltnfIpsihlhpReNdxB3L3Mv3V+D50iC+kuERoxiNS8pqDL+54RrFkfA==
X-Received: by 2002:a05:6402:33a:: with SMTP id q26mr4722857edw.224.1605303308074;
        Fri, 13 Nov 2020 13:35:08 -0800 (PST)
Received: from ?IPv6:2a01:110f:b59:fd00:b15d:6782:80f1:8d19? ([2a01:110f:b59:fd00:b15d:6782:80f1:8d19])
        by smtp.gmail.com with ESMTPSA id l25sm5019991eds.65.2020.11.13.13.35.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Nov 2020 13:35:07 -0800 (PST)
Subject: Re: [PATCH] s5p-jpeg: hangle error condition in s5p_jpeg_probe
To:     Baskov Evgeiny <baskov@ispras.ru>,
        Andrzej Pietrasiewicz <andrzejtp2010@gmail.com>
Cc:     Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org, ldv-project@linuxtesting.org
References: <20201113160625.1281-1-baskov@ispras.ru>
From:   Jacek Anaszewski <jacek.anaszewski@gmail.com>
Message-ID: <f8c9ea26-fc55-d65d-e2b3-734af8b97c95@gmail.com>
Date:   Fri, 13 Nov 2020 22:35:05 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201113160625.1281-1-baskov@ispras.ru>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Evgeiny,

Thank you for the patch.

There is a typo in the subject: s/hangle/handle/

Otherwise:

Acked-by: Jacek Anaszewski <jacek.anaszewski@gmail.com>


On 11/13/20 5:06 PM, Baskov Evgeiny wrote:
> If an error happens in jpeg_get_drv_data(), i.e. match fails,
> jpeg->variant field is NULL, so we cannot access it.
> 
> Consider device probe failed if jpeg->variant is NULL.


-- 
Best regards,
Jacek Anaszewski
