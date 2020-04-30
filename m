Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B017C1BFBE8
	for <lists+linux-media@lfdr.de>; Thu, 30 Apr 2020 16:02:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728978AbgD3OC2 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 30 Apr 2020 10:02:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56524 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729147AbgD3OCX (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 30 Apr 2020 10:02:23 -0400
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com [IPv6:2a00:1450:4864:20::243])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 37561C035494;
        Thu, 30 Apr 2020 07:02:23 -0700 (PDT)
Received: by mail-lj1-x243.google.com with SMTP id a21so6594391ljb.9;
        Thu, 30 Apr 2020 07:02:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:from:to:cc:references:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=N+Ht0CmfDxJVUU6J4yFlhD6kd2eTTrdGjBG9WTx/UyQ=;
        b=XPLsH1OV1IK/7IHKpVHzrXqje08ez4AfmDTnVvgYOvBOy0FfpRqK+D9XYPlaE05rNQ
         tbWt8gHkoewEz1ZUIHtmfsi6katLHTeLsDVuZdrrb/9kmBnnr7Nqg4uaZMHik+Lfx6bT
         CnqceWSKVJEUN9qF/EyddjcmjwKe2GCmxEKpOxxTndVb9qiTjOzT0MYSxJFK+kGc+B1U
         ss1n7PFEVRDR/o9znXtZsEQYylgNtoHQJBLwCePduH/UfxVLEX40B8VRVdyP8pEunGTV
         kZTPfxQ4HNrinx9RBPk88XHaX88dN3YSuwQOdCnup6aHtdw0gsWv+BchoKbWH6xQEaEw
         K0mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:from:to:cc:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=N+Ht0CmfDxJVUU6J4yFlhD6kd2eTTrdGjBG9WTx/UyQ=;
        b=s57I4YQgB+D0UXAnhqsItvyDVqjJNqarQ00pQ/nIAnEcQUg+rjc9mJVF93UqcRDv+9
         BJ87PNUr0/ZI4c83Ey5jbxBj2bGsIVMNyhgaE6y+hK+iP/Rgdl8mi45QH1ifOfqMHM/e
         8LA05IGc6tnnWLMKTksdCBgCrV0lZbTIKk615KkLmHnZA3p7NzgD7wwNss5AGMNC9aBr
         ipGI3mPTSzrUjqgqnTI1atvcwF4OX2zHt9RPyIr6cfvr8jlMneUdXp5rOWtll0WfnJ0R
         7R1pXHW4ODbWl9Jj4gayufqn+n+ojVz7fBATu53t+ARa27L5engxI6uLxZZ02rC5CCoh
         g9cQ==
X-Gm-Message-State: AGi0PubsdP8A1WQGp7T6pGEU46IiNbmVW5kRWUoRoj/KegF+QT8CReSj
        a6/i9R+F0bzyEbMoozGwfXC8yt19
X-Google-Smtp-Source: APiQypInaM7ORzF/CVsxNxUc0J9Cyf/Q6St4WH9tVfb2A8VygbMaxJllBH4AhcGid0vObbUWazuWjQ==
X-Received: by 2002:a2e:87d9:: with SMTP id v25mr2275164ljj.241.1588255341268;
        Thu, 30 Apr 2020 07:02:21 -0700 (PDT)
Received: from [192.168.2.145] (ppp91-78-208-152.pppoe.mtu-net.ru. [91.78.208.152])
        by smtp.googlemail.com with ESMTPSA id v8sm4886684lfp.85.2020.04.30.07.02.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Apr 2020 07:02:20 -0700 (PDT)
Subject: Re: [RFC PATCH v11 6/9] media: tegra: Add Tegra210 Video input driver
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Sowjanya Komatineni <skomatineni@nvidia.com>,
        thierry.reding@gmail.com, jonathanh@nvidia.com, frankc@nvidia.com,
        hverkuil@xs4all.nl, sakari.ailus@iki.fi, helen.koike@collabora.com
Cc:     sboyd@kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
References: <1588197606-32124-1-git-send-email-skomatineni@nvidia.com>
 <1588197606-32124-7-git-send-email-skomatineni@nvidia.com>
 <bacc4308-4b95-f566-b80e-096ff96407b5@gmail.com>
Message-ID: <4da289e6-036f-853b-beb4-379d6462adb0@gmail.com>
Date:   Thu, 30 Apr 2020 17:02:19 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <bacc4308-4b95-f566-b80e-096ff96407b5@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

30.04.2020 16:56, Dmitry Osipenko пишет:
> 30.04.2020 01:00, Sowjanya Komatineni пишет:
>> +static int chan_capture_kthread_finish(void *data)
>> +{
>> +	struct tegra_vi_channel *chan = data;
>> +	struct tegra_channel_buffer *buf;
>> +
>> +	set_freezable();
>> +
>> +	while (1) {
>> +		try_to_freeze();
> 
> I guess it won't be great to freeze in the middle of a capture process, so:
> 		if (list_empty(&chan->done))
> 			try_to_freeze();

And here should be some locking protection in order not race with the
chan_capture_kthread_start because kthread_finish could freeze before
kthread_start.

>> +		wait_event_interruptible(chan->done_wait,
>> +					 !list_empty(&chan->done) ||
>> +					 kthread_should_stop());
>> +
>> +		/* dequeue buffers and finish capture */
>> +		buf = dequeue_buf_done(chan);
>> +		while (buf) {
>> +			tegra_channel_capture_done(chan, buf);
>> +			buf = dequeue_buf_done(chan);
>> +		}
>> +
>> +		if (kthread_should_stop())
>> +			break;
>> +	}
>> +
>> +	return 0;
>> +}
> 

