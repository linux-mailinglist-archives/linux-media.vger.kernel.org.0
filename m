Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2EF834AA10E
	for <lists+linux-media@lfdr.de>; Fri,  4 Feb 2022 21:17:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237153AbiBDUR1 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 4 Feb 2022 15:17:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44870 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237040AbiBDUR1 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 4 Feb 2022 15:17:27 -0500
Received: from mail-qv1-xf33.google.com (mail-qv1-xf33.google.com [IPv6:2607:f8b0:4864:20::f33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7E48FC061714
        for <linux-media@vger.kernel.org>; Fri,  4 Feb 2022 12:17:25 -0800 (PST)
Received: by mail-qv1-xf33.google.com with SMTP id g13so6270827qvw.4
        for <linux-media@vger.kernel.org>; Fri, 04 Feb 2022 12:17:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20210112.gappssmtp.com; s=20210112;
        h=message-id:subject:from:to:cc:date:user-agent:mime-version
         :content-transfer-encoding;
        bh=T3CE4qyVqd9hVt4/5apuLqgyvkgZ4lFFT/522tPiaEE=;
        b=RzDWDIqNUOgtIzof9CR+sHL45rKk3IuoR0+ofVYl1/M4s8gU9Se9V79UMFNzdc9BRP
         tCsjJDYqXkm0KnEV7zpWO8cYlKSa8byDo/UiA2Eeq65UuNiy7s+dYISJenmq58vjM0W7
         0P1w2U0SazivnfdU8o1M/CqtVzX6morb38jzylm9sgJ5/HQv9+/Hz4s0kysj1q0WGDbh
         S+pBQcHek1tu3ULNK1gEZBNB9N+QzEY5+6n50btaqFnSs7825onjbu6S0XalWG/HQCG9
         LFqQywN3gOlLCr39J7yT0zj9Mhjon0iURmRYjapOSHChxAdFKiOekE8AYJQs9azldFfw
         P8MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:user-agent
         :mime-version:content-transfer-encoding;
        bh=T3CE4qyVqd9hVt4/5apuLqgyvkgZ4lFFT/522tPiaEE=;
        b=jdDKto/4aGLq0fUyWsosE2QKX+KI9bV+WCFr1CDdJR91zdDQIDirMX1/f+Gqi54Poi
         s1i5kU6g0sHuvVtz0Gcx150HTNK+1Izz4T64zfprlSA8wMum2zRCR5mZaVm8zDoM66l4
         zQg7WY7eIBuz/i6Oy2inTU4/u4dl/GlAJbHmga9UaCNUwbZyUSWGT/nCe+11qkrbS7D+
         rP3hvQeg+aJnUW8JW5OtNqKuSVe1m6L6eDt5SlzHwIXuXGuBN0fS3YVAa13xjm9f/IdK
         5bTZhvZvVcE+izGWuZOplvfWJdoMsuS1fVfTSmW0+BZAQe5LT/7dR+t/X3qfDtNCmLOV
         i+tA==
X-Gm-Message-State: AOAM533dGlCgOYKFSVFF6/NvOOyrt0nONgZd+V2TgLhPvmwqFJPAg0zk
        ejY5amNSPelpI7w3v3efGFLPSfblbCzvIw==
X-Google-Smtp-Source: ABdhPJw12tYMbXWGz+eHMLb21WrMcwr9k5yGlyLi3olZDlaXDZ/LxNHnhy3H8Xb9JfjyUeLJMEYoDA==
X-Received: by 2002:a05:6214:20ea:: with SMTP id 10mr3247503qvk.54.1644005844654;
        Fri, 04 Feb 2022 12:17:24 -0800 (PST)
Received: from nicolas-tpx395.localdomain (173-246-12-168.qc.cable.ebox.net. [173.246.12.168])
        by smtp.gmail.com with ESMTPSA id k20sm1744628qtx.64.2022.02.04.12.17.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Feb 2022 12:17:24 -0800 (PST)
Message-ID: <0265202a22507d0c8dccc9d3985c2b8ec0b266ec.camel@ndufresne.ca>
Subject: VP9 SVC Feedback data in V4L2 encoders
From:   Nicolas Dufresne <nicolas@ndufresne.ca>
To:     Stanimir Varbanov <stanimir.varbanov@linaro.org>
Cc:     Daniel Almeida <daniel.almeida@collabora.com>,
        linux-media <linux-media@vger.kernel.org>,
        kernel <kernel@collabora.com>
Date:   Fri, 04 Feb 2022 15:17:23 -0500
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.42.3 (3.42.3-1.fc35) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Stanimir,

I know you were looking for some ways to pass back data post encoding per frame
in V4L2 a while ago, but I think I lost track. I *think* you were looking for a
way to pass back HDR10+ metadata from the decoder. I'm currently trying design a
a way to pass back SVC encoded frame info (layer(s)_id and references). This is
somewhat similar, for each frames being encoded I need some information from the
encoder, so I can pass it back to the RTP payloader. This issue was fixed in
AV1, but VP9 is still pretty important.

On my side, I was thinking that a driver could stack the data per encoded buffer
internally, and update a control state at DQBUF(capture) time. This should not
be racy, as the next update will stay pending till the next DQBUF, but I'm
worried of the overhead and maybe complexity.

your feedback would be welcome,
Nicolas
