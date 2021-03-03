Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 472B832C7F7
	for <lists+linux-media@lfdr.de>; Thu,  4 Mar 2021 02:13:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1355731AbhCDAdS (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 3 Mar 2021 19:33:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44238 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231827AbhCDAAr (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 3 Mar 2021 19:00:47 -0500
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com [IPv6:2607:f8b0:4864:20::629])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8D7CBC0613EE
        for <linux-media@vger.kernel.org>; Wed,  3 Mar 2021 15:41:21 -0800 (PST)
Received: by mail-pl1-x629.google.com with SMTP id a24so14964106plm.11
        for <linux-media@vger.kernel.org>; Wed, 03 Mar 2021 15:41:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=penguintechs.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=lxXHIViYyH7+/Y43foBnb6LY+K22KwDN/bN+xdZT104=;
        b=ZcH24reccpQoScHpLGPrcn2PoaNtR//yUOfrRXHCkp/BaMRLSuyj52QI2gWi8KI3Il
         23fIQI2sezf6oG9q5oIu1mlXtXLxPEcoqSkqkmtn8/OCtfiNtpBOYA5LHJfGHcdKlCj4
         X8Jdhu1RjK32TYBFHRrPzXS3HWrGiVhqmS3oc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=lxXHIViYyH7+/Y43foBnb6LY+K22KwDN/bN+xdZT104=;
        b=FemizTqWw+JFQToxIH04HCYK3Y2Nr0H9Ro7zfkXu5/tYgiv7pzfFQKTSeCnVhzHHad
         ss2czUF0xsn7w9XWkmcWmZ/q1G/MI8cywtutwoz8gO2TGjz6ZKknDsSYNYxTeCOqPIie
         iVyAdpxyh8ihroUKsFufTdCUAQ2USmF8nNf3rO6fkAuyvw8x72li4b8LhhSwlmIxbu2N
         4iENKgnkyMDUPHFRh5QQ8dQvTPpGHXxqnZ+F0Ju1nUgBB5sb+XE5+7XZ5G97N+zL41bB
         oP6CDlbXuGfEPS5kin3nmkoOd1msI/AqZAf3i+3dOiVrSN3+piHiRdWPQ4RBq9oPNIHs
         siBQ==
X-Gm-Message-State: AOAM530lrkkikIE63HttgsRH6Bzn3NXxofE45b+Ft4xZwBaRk/o+tlMT
        3fJ//86nZuzjDj8MCZkPBYWBfP2lVV2gcQ==
X-Google-Smtp-Source: ABdhPJyVhZl8UClHIsDXe9FMzGxkp9OKnAwRWt+UUtWD+PH9KOPEzu6zBLb8y3AbdjrxIZ9RGS3kgQ==
X-Received: by 2002:a17:90a:29a3:: with SMTP id h32mr1518749pjd.209.1614814880442;
        Wed, 03 Mar 2021 15:41:20 -0800 (PST)
Received: from braindead.localdomain (c-71-202-115-154.hsd1.ca.comcast.net. [71.202.115.154])
        by smtp.gmail.com with ESMTPSA id t22sm2386086pjw.54.2021.03.03.15.41.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 03 Mar 2021 15:41:19 -0800 (PST)
Subject: Re: v4l2loopback and v4l2-mem2mem framework
To:     Nicolas Dufresne <nicolas@ndufresne.ca>,
        Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Cc:     linux-media <linux-media@vger.kernel.org>
References: <45cda97c-a0e4-eef2-ba8f-ddc7e33b40d5@penguintechs.org>
 <4cdd691f-dc55-fc6e-1830-ac0c24b8e96b@penguintechs.org>
 <CAAEAJfCSfwxv5NyaH05Dfiw4wm6vGxL_ajoFup6r-GKx_VymJA@mail.gmail.com>
 <86f1dd6b-7593-adba-b5a6-abf4f8e35d8b@penguintechs.org>
 <b0c87b78-de21-07b5-6ae0-39401cf005b9@penguintechs.org>
 <2a70dbaaee14acd5652c80df2176ac9b183c6e1b.camel@ndufresne.ca>
From:   Wren Turkal <wt@penguintechs.org>
Message-ID: <4b7ddda5-47bf-8514-feb2-f66df9219850@penguintechs.org>
Date:   Wed, 3 Mar 2021 15:41:18 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <2a70dbaaee14acd5652c80df2176ac9b183c6e1b.camel@ndufresne.ca>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Questions below.

On 3/3/21 2:41 PM, Nicolas Dufresne wrote:
> No, since m2m are instance base, you cannot have two process operating on the
> same node (there is only 1 streaming state). You'd probably want to look at
> extending the VIMC driver instead. It's a virtual media controller, it's missing
> few bits to make loopback possible, but would be a good fit.
>
> Note that vivid have a loopback capability, but it does not constraint the
> width/height/format and will produce a test pattern if you request something
> that differ from the source.

I am not sure which you're suggesting to use: vivid or vimc. Also, are you
suggesting to extend them or use them as a template for a new module?

I think you are saying that vivid can already do loopback. However vivid is
a test driver and, like vim2m, doesn't ship with distribution kernels. Should I
try to move it out of the test-drivers?

> It is very buggy, it often return a queued buffer back, and in fact, if you try
> to use the queue too much it fails. Though all this would probably be fine if
> you port it to VB2.

I am assuming you are saying to port v4l2loopback to vb2. I am working on that
right now, but I am not sure how to proceed since the vb2 needs a queue for
capture and a queue for output (since they cannot be the same). I have created
the queues, but I am not sure how to further integrate. Please check out the
WIP here:
https://github.com/wt/v4l2loopback/commit/e71b0a50427729a5e6e74443066751f7321dc404

If the m2m is the wrong approach, do you have any suggestions for how to
proceed?

Also, I am currently making a change for the linux kernel moving this code
info drivers/media/v4l2-core/v4l2-loopback.c so that I can start iterating
with your feedback. Is that a correct place to put this code?

Thanks,
wt

