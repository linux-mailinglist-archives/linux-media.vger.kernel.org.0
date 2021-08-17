Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1A6BC3EEB1D
	for <lists+linux-media@lfdr.de>; Tue, 17 Aug 2021 12:41:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236594AbhHQKmQ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 17 Aug 2021 06:42:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60654 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235380AbhHQKmP (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 17 Aug 2021 06:42:15 -0400
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com [IPv6:2607:f8b0:4864:20::102a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9E614C061764
        for <linux-media@vger.kernel.org>; Tue, 17 Aug 2021 03:41:42 -0700 (PDT)
Received: by mail-pj1-x102a.google.com with SMTP id cp15-20020a17090afb8fb029017891959dcbso4423717pjb.2
        for <linux-media@vger.kernel.org>; Tue, 17 Aug 2021 03:41:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=ziGJcTCS+ZXDXHbNImBiMiKR28CUbjajUlGyaY3CzMg=;
        b=ED+6iEB1IDQ11WklEbAfULbzXPgEsrb2Qek0mvhKNiE8D4Xjl+hqwICL0X7Q+szQeQ
         tN0mEk5Xv2vYFRSQtvj1NmkFzPD9yNqpu4/8GNPX4XY9aYbt/Ye5ouItZSew0Rym5TEp
         qYVgByH2DR9wqNZkPbfPsaeXIj/5pvEsrh96E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=ziGJcTCS+ZXDXHbNImBiMiKR28CUbjajUlGyaY3CzMg=;
        b=mI358MvT0hKa7/BaAl1y5Rh8VWiuRyVwq0CxPinNewYrkdj7nGLv8D+LeLRXpfMisT
         wwoA7sUgpyWGKc0nv+ULAhnVxio6ArHS554+oonIKLem/VZH16oYCoAksWc54I9f638n
         jmf1VXDishyIK76/bNwUGw1biqzO3Wxzvo+rE6F6xDb2KP1KUM3ozrdqdzK2eG1JDGvB
         BXT4q03ugjGdsjlhNqBmcZ8/cMe3hvf85I01pDkLpErh9o26HiBozUqfeiVRMjw0aUPc
         Qfyt/T5qZwku6mELNjmY7t1FnvlCow6unlrjOLqnfTM403ZpY6IfFOITMvIC3cPD+w4T
         e+MA==
X-Gm-Message-State: AOAM532+CCmUGYBrr6o58HvaILnJdSIra5yfsuf3JodJGshWI9QbzfjF
        gWVew+2zc3jPoQ/2Ld6E4XFn7Q==
X-Google-Smtp-Source: ABdhPJwOcZm7BOUvVE3bZo5kMUCHlSCbRS2sBynHVAV9CB/YF4ic562AKE/x3eajJJAQmTQNWo7emg==
X-Received: by 2002:aa7:838a:0:b029:3b7:31a5:649c with SMTP id u10-20020aa7838a0000b02903b731a5649cmr2949362pfm.44.1629196902228;
        Tue, 17 Aug 2021 03:41:42 -0700 (PDT)
Received: from google.com ([2409:10:2e40:5100:8aab:cb84:5fe8:99dd])
        by smtp.gmail.com with ESMTPSA id x14sm2227345pfa.127.2021.08.17.03.41.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Aug 2021 03:41:41 -0700 (PDT)
Date:   Tue, 17 Aug 2021 19:41:36 +0900
From:   Sergey Senozhatsky <senozhatsky@chromium.org>
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc:     Sergey Senozhatsky <senozhatsky@chromium.org>,
        Tomasz Figa <tfiga@chromium.org>,
        Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
        Ricardo Ribalda <ribalda@chromium.org>,
        Christoph Hellwig <hch@lst.de>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCHv4 3/8] videobuf2: split buffer cache_hints initialisation
Message-ID: <YRuSYMKHq6wIqphV@google.com>
References: <20210727070517.443167-1-senozhatsky@chromium.org>
 <20210727070517.443167-4-senozhatsky@chromium.org>
 <148b9d78-7515-eb1d-7e38-f8e1052d057c@xs4all.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <148b9d78-7515-eb1d-7e38-f8e1052d057c@xs4all.nl>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On (21/08/03 10:10), Hans Verkuil wrote:
> On 27/07/2021 09:05, Sergey Senozhatsky wrote:
> > V4L2 is not the perfect place to manage vb2 buffer cache hints.
> > It works for V4L2 users, but there are backends that use vb2 core
> 
> use -> use the
> 
> > and don't use V4L2. Factor buffer cache hints init and call it
> 
> Factor? You mean Refactor?

Factor out.
