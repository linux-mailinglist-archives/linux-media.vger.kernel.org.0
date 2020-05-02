Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 49FFC1C2849
	for <lists+linux-media@lfdr.de>; Sat,  2 May 2020 22:49:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728533AbgEBUsr (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 2 May 2020 16:48:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60676 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728472AbgEBUsr (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sat, 2 May 2020 16:48:47 -0400
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com [IPv6:2a00:1450:4864:20::243])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9C146C061A0C;
        Sat,  2 May 2020 13:48:46 -0700 (PDT)
Received: by mail-lj1-x243.google.com with SMTP id g4so5869996ljl.2;
        Sat, 02 May 2020 13:48:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=7s/4VcNmw1wJVQ1beU53IUkohldspgncL00MxHfRDtc=;
        b=ewx0eis3GDwHmOvVENFcmg9kjEyLj36dLMtAzUTSqHgUB+5HxuvcNVZ/egsYw85Khe
         yNQzEaUOnQlHNTdB9izwQqQE8UAIsvMU+LwNaCln1kjHR9CxmooE5Dsec/eIEEdhftsy
         qXi235uE3IwSIFP8iLYNwf9xgqSPv1Nvvjrz7PYpGu69m05S7/5ISTl0E5quQ11MDq2m
         Yxd5H+IKx0XRAxdc5clTC0y+ZnyaBeK71wuy01yklRNvsN8xUePNSjaF76bR0/tfq8q9
         9crj4zy4VPswdthr+08b1QZquKkRkB4PZ4TgSNuCpMAqi+vbFg1WEQ+AfFE2PI2ddUzk
         YilQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=7s/4VcNmw1wJVQ1beU53IUkohldspgncL00MxHfRDtc=;
        b=HOhEDqYoUu3uKufILGLqss7q6EZucAog7DPyBBEOy7cUMgEy8FohhBHx+4bRxp1HgT
         eC7ojM/mO9f/d4/pgG/cZeaoFjxXMi1BoZN5VlNOYEDohN7NYDamangMBp1VP0aB+4Ct
         qhLGGn2sesU4GKQ7t6UHKBFkJm+1tB4gkDfC/D8kaSgjuXP+ic9659Z71u6mGci10m5t
         fMvKdtdypdb9LhLXTDQySjXW1AbAx/V7t8DVfBb0RCMwOiQsAQ4GMlt/Ynk9DrQPS5Q0
         CS0u8ZHXzKTIRsV/yQDs+eK84DQaM0+fBFMmhTvvrFB7RRZnTs8ApbxOH5nQFYc9oslI
         A1+w==
X-Gm-Message-State: AGi0PuZrMlN+Tnt7iBuhQT6yiYSK3NzE+W0ZMu+8VLNtO2rHDpGiJHmF
        BS94qMZLTqH832XwnuVa88N7Pvqy
X-Google-Smtp-Source: APiQypJoM7fRjqmtoWZmB620LDMpi4Oh+ILfKnuEtXzQJUokAIqy6LiWN/mkJpdrkGv6B6qPA3Fh6A==
X-Received: by 2002:a05:651c:107a:: with SMTP id y26mr6065337ljm.80.1588452524597;
        Sat, 02 May 2020 13:48:44 -0700 (PDT)
Received: from [192.168.2.145] (ppp91-78-208-152.pppoe.mtu-net.ru. [91.78.208.152])
        by smtp.googlemail.com with ESMTPSA id q125sm4572080ljb.34.2020.05.02.13.48.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 02 May 2020 13:48:43 -0700 (PDT)
Subject: Re: [RFC PATCH v11 6/9] media: tegra: Add Tegra210 Video input driver
To:     Sowjanya Komatineni <skomatineni@nvidia.com>,
        thierry.reding@gmail.com, jonathanh@nvidia.com, frankc@nvidia.com,
        hverkuil@xs4all.nl, sakari.ailus@iki.fi, helen.koike@collabora.com
Cc:     sboyd@kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
References: <1588197606-32124-1-git-send-email-skomatineni@nvidia.com>
 <668d9b65-9590-cc97-41c3-2c1a5cfbbe61@nvidia.com>
 <289d9c92-383f-3257-de7b-46179724285a@nvidia.com>
 <9aa64f21-7b23-7228-b5eb-d2ff092682ad@nvidia.com>
 <668cc4a0-2c81-0d87-b801-9fbf64e19137@nvidia.com>
 <bf3f654e-b8f8-d560-fc5e-03d73cb7eab0@nvidia.com>
 <525e481b-9137-6fdd-bbf9-3779a5704e6b@nvidia.com>
 <fe7ebad6-0368-b1f0-4f58-648baa5e3f79@nvidia.com>
 <4f095181-2338-3b71-316c-f8bbfc7865cc@nvidia.com>
 <50e872bb-913a-7b47-3264-af6b1cedb0e2@nvidia.com>
 <e17a8a49-be53-465d-f64c-3f4c77391d98@nvidia.com>
 <da5154b4-85f9-3e56-a440-f75debaec3a8@nvidia.com>
 <cbb047ae-97dc-8b9a-a5ba-8e2a5dab3771@nvidia.com>
 <6ae2d00d-7955-d12b-5b56-955ef72ece26@nvidia.com>
 <f9073b28-f1f1-636c-be53-764fb0a531a1@gmail.com>
 <1767e50f-efb7-5e89-22f6-0917821b660d@nvidia.com>
 <235a4cd4-4d4a-04b8-6c65-43a4dba48a0b@nvidia.com>
 <f8103170-7879-8597-3e3c-da9a3b6a40b3@nvidia.com>
 <5d847770-dad9-8f18-67b5-c1ba79084957@nvidia.com>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <4abf30e0-fed9-ba39-ae38-350789bce99d@gmail.com>
Date:   Sat, 2 May 2020 23:48:42 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <5d847770-dad9-8f18-67b5-c1ba79084957@nvidia.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

02.05.2020 19:55, Sowjanya Komatineni пишет:
> Also stop stream ioctl request happens during suspend where both threads
> will be stopped properly. done thread stop happens only after finishing
> all outstanding buffers.

Do you mean that V4L core takes care of stopping the streami on suspend
and re-starting it on resume from suspend?

> Stop stream request happens from streaming applications so even without
> driver suspend/resume implementation currently, streaming will be
> stopped prior to system  suspend where both threads will be stopped
> properly (after finishing out standing buffers) and will be resumed by
> application on system resume

All userspace is frozen on suspend. System suspension is transparent for
userspace applications. I'm not sure what you're meaning here.

> Also tested suspending while streaming with this unconditional freeze, I
> don't see any issue as application stops stream where v4l_streamoff gets
> executed during suspend and on resume streaming starts where
> v4l_streamon happens.
> 
> So, I don't see any issue with existing implementation of unconditional
> freeze.

I don't understand why freezing is needed at all if V4L core takes care
of stopping the stream on suspend, what is the point? If there is no
real point, then let's make threads non-freezable and done with that.
