Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2F0CE1F7A9F
	for <lists+linux-media@lfdr.de>; Fri, 12 Jun 2020 17:20:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726388AbgFLPUT (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 12 Jun 2020 11:20:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35554 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726272AbgFLPUT (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 12 Jun 2020 11:20:19 -0400
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com [IPv6:2a00:1450:4864:20::533])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3DE11C03E96F
        for <linux-media@vger.kernel.org>; Fri, 12 Jun 2020 08:20:19 -0700 (PDT)
Received: by mail-ed1-x533.google.com with SMTP id c35so6705568edf.5
        for <linux-media@vger.kernel.org>; Fri, 12 Jun 2020 08:20:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=to:cc:from:subject:message-id:date:user-agent:mime-version
         :content-language:content-transfer-encoding;
        bh=w0BLx/Yb1xMdASFemzJHlnStrv0tSRDqkM3p+P3utx0=;
        b=cwc9p9+Q/BDRTWHJJUNoSrkl8Xcf2A6qutsAJ7JAVL54nzx2azGKepXk4J7zZMMgmt
         g+chw/JicTgl0yyyVjP4+3Q02qEiKjeDY4JnMKRWt8PPqvxBtvpOmo5mF/SkdBEbdLnR
         13ZoxaxT9hfsEmrAWcrmESQC/FhA6uWyJybWfdSJJHkDA5rlStCUizSlWLm+RrpxDuVS
         DuU87E0cY2XbdkH0FvR15L38XexLt9Xc8fge+CeNANlkvDRYOZI9NaDHQOdGtJPUq3Nh
         ip7qzox1SPuAqTSzfPSwdRtHhTVryOIONO2/+zj8XBErVxY8eRr/KboZ1E0Sw7z8ka6R
         +Ucw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:to:cc:from:subject:message-id:date:user-agent
         :mime-version:content-language:content-transfer-encoding;
        bh=w0BLx/Yb1xMdASFemzJHlnStrv0tSRDqkM3p+P3utx0=;
        b=oclGKGklJTv3PXfDtPCPz6wyvXADln2FuL2u6mMP3pcK3k//GAiH2MT7xjap2qQeN8
         yKbKNak9jXQM15SsD/0RunJUq3KbBjhGwB7Umxucl2TQHwaKi7V9hb/OBrR09Rp38Kq9
         T5wXnvRr+Fc6gLn2aGoFuHs4IE3/d92AtxhUrGNZuQsKqV8IR9E/IoeMAGZu0RsPoAmi
         Gb9SlbP5o+Mqwo5fV+wXguu90xLOFQJmgqDhBxy0DZbLbc23Oy+1OSyFGyv/Sb7AtwZ0
         OEPnGUoQPzufIWZMx2aUh/nV08Xsh0/R6Hk2OyjaPLgvfwY1S6SZjvNYVhzr3TbeecVb
         r6qg==
X-Gm-Message-State: AOAM5314XJ8HzyYKRapL4tdNhfFD3N/QiSsEoAAlkkYmHfJbk3H2Od+h
        ae6+uMVUIL12P5Td9iru0dieQQ==
X-Google-Smtp-Source: ABdhPJz1Gv3+XseglEaR0L46Km8v2TbUxFKgX3Ur5aSmVY7dYkuiP/MHwlQITZ2axasmW8KqSqdvuA==
X-Received: by 2002:a50:e881:: with SMTP id f1mr11697081edn.98.1591975216296;
        Fri, 12 Jun 2020 08:20:16 -0700 (PDT)
Received: from [192.168.1.3] (212-5-158-24.ip.btc-net.bg. [212.5.158.24])
        by smtp.googlemail.com with ESMTPSA id z10sm3740893ejb.9.2020.06.12.08.20.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 12 Jun 2020 08:20:15 -0700 (PDT)
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
Cc:     Hans Verkuil <hverkuil@xs4all.nl>, Tomasz Figa <tfiga@chromium.org>
From:   Stanimir Varbanov <stanimir.varbanov@linaro.org>
Subject: reqbuf(count=0), new vb2 op or something else
Message-ID: <5408d9f1-6415-7089-8069-ec36cd9eed75@linaro.org>
Date:   Fri, 12 Jun 2020 18:20:14 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

I failed to found previous discussion on the subject, maybe it was on IRC.

I stuck with fixing of issues which depends on this reqbuf(count=0).
Currently I'm counting the buffers in vb2::buf_init and vb2::buf_cleanup
but I don't want to rely on that implicit way anymore.

If someone of you can remember let me know so that I can prepare an RFC.

I can think of two options:
 - change vb2::queue_setup so it could be called with num_buffers=0
 - add new vb2::queue_release op

More options?

-- 
regards,
Stan
