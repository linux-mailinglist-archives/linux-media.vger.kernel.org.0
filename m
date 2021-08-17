Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2EBDD3EEB27
	for <lists+linux-media@lfdr.de>; Tue, 17 Aug 2021 12:44:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239657AbhHQKoe (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 17 Aug 2021 06:44:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33018 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238994AbhHQKob (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 17 Aug 2021 06:44:31 -0400
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com [IPv6:2607:f8b0:4864:20::1035])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1CDDBC061764
        for <linux-media@vger.kernel.org>; Tue, 17 Aug 2021 03:43:59 -0700 (PDT)
Received: by mail-pj1-x1035.google.com with SMTP id nt11so31434398pjb.2
        for <linux-media@vger.kernel.org>; Tue, 17 Aug 2021 03:43:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=YGFOswNj4U60TUcxN9v9R5x9N7e7GcdgIc0GEz7algA=;
        b=OFqM+3QreNPzcnFtzNDkC7MxH0tpTt2fd3eFkyJmoRvo83Spc4+QsQrYEqt437OvSX
         1WEWjs8iOoL/Ldrw7K3A6oUocP7LqoyFIqRyiINMIfLwmE8znRPuaAXxd8za0NEFqUgJ
         eH9gKGMp4xMD+ZvZgFgJ9Ip2Vgfvl7+ybGsiA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=YGFOswNj4U60TUcxN9v9R5x9N7e7GcdgIc0GEz7algA=;
        b=edfCtOenszX4s5qurUG2IYuid1clXtRtHDTo7O1kSNwiNY/yX001o7d5qEMPwJ5s4y
         Ub/mTycWy/OqLwBYITXlY0tr2whJQ7m1qLlXgsjXNlNMOe9AjlRX9Wwer60JSfQPYkmd
         tMAza3Eclc13M89iIsYUAkHJFsAMBUynCpA9wjK448epb3+pqXqgG+KoAPeBmuraWvLM
         teBz70JLeAKUYEhV/xCPgZ8bwOyw2wEDaOdXbgipNVXYwCDk6tn/MrTgM8xzpbhXPiqJ
         iIDd0ge+4RfTlUgLm8IEhhzaCXdlFBAR5KS0S2keFWAKaXFyN/xE8riHXELtrhGCLmE0
         Nqtg==
X-Gm-Message-State: AOAM530Lh9fTgnUlGZOkNOT2vruZACh9WS/Ts9LW/Y8pye+33zUmM1K+
        kQZLZlWwKctDruZQ/ZZPpHae7g==
X-Google-Smtp-Source: ABdhPJwH4PeooJAIwXgO7OxBS6D8WfvIPKOnM/WFFb/aRA6M3UlytnsUtIf87E2vlYkiQXAhfc8xDw==
X-Received: by 2002:a62:1650:0:b0:3e2:15fc:3347 with SMTP id 77-20020a621650000000b003e215fc3347mr2899724pfw.77.1629197038748;
        Tue, 17 Aug 2021 03:43:58 -0700 (PDT)
Received: from google.com ([2409:10:2e40:5100:8aab:cb84:5fe8:99dd])
        by smtp.gmail.com with ESMTPSA id c133sm2332449pfb.39.2021.08.17.03.43.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Aug 2021 03:43:58 -0700 (PDT)
Date:   Tue, 17 Aug 2021 19:43:53 +0900
From:   Sergey Senozhatsky <senozhatsky@chromium.org>
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc:     Sergey Senozhatsky <senozhatsky@chromium.org>,
        Tomasz Figa <tfiga@chromium.org>,
        Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
        Ricardo Ribalda <ribalda@chromium.org>,
        Christoph Hellwig <hch@lst.de>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCHv4 7/8] videobuf2: handle V4L2_MEMORY_FLAG_NON_COHERENT
 flag
Message-ID: <YRuS6eH06Eun3+bI@google.com>
References: <20210727070517.443167-1-senozhatsky@chromium.org>
 <20210727070517.443167-8-senozhatsky@chromium.org>
 <e9cc4ec2-96be-3f3a-3723-6e262b1f8bb1@xs4all.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e9cc4ec2-96be-3f3a-3723-6e262b1f8bb1@xs4all.nl>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On (21/08/03 10:31), Hans Verkuil wrote:
> 
> s/to//
> 

Done, thanks.
