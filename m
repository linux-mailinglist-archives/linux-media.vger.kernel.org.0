Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F20563EEB23
	for <lists+linux-media@lfdr.de>; Tue, 17 Aug 2021 12:42:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239704AbhHQKnR (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 17 Aug 2021 06:43:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60908 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239692AbhHQKnQ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 17 Aug 2021 06:43:16 -0400
Received: from mail-pl1-x630.google.com (mail-pl1-x630.google.com [IPv6:2607:f8b0:4864:20::630])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2C024C061764
        for <linux-media@vger.kernel.org>; Tue, 17 Aug 2021 03:42:44 -0700 (PDT)
Received: by mail-pl1-x630.google.com with SMTP id n12so23743896plf.4
        for <linux-media@vger.kernel.org>; Tue, 17 Aug 2021 03:42:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=OLyh2KpfOQWfx2js4q6VQOJIvhSbi9GXuU5cXSBeasU=;
        b=WdlxhsI0dgiJvvPf64Gt3FE1babeUqQHZNPhFnFe2tFwxIROlz0XOWuDxUnYxH00M1
         XuBviAfE5jXM8ZLuyqIiseZpAZvNXKs8UC1eEOaIswTOvcyv4bXWjIpxI9YNMcx9NIe8
         MlLaKMo2aySiThtDOHd9Oyd5VdHjrlTpQsWeo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=OLyh2KpfOQWfx2js4q6VQOJIvhSbi9GXuU5cXSBeasU=;
        b=FxZ5WE82HLL50rHgjkG86G6X/g0zG0YMIZkBn0vbuKvjQ3m1kiM9Ih298GSpV05x6V
         s39KlEbr3J4EjbvLClTzfVsQA6fqEalowJhV6acXKmOjLHWn2/Mxae+y9Kk5W6uI7qy1
         OekQ6CEJTNgalTG3aO/BJAC6vkqxyxygP6bh9/mcAPYzgiL5V/e3dWVytawZowksrXF0
         OqsRajPB3DAqiX1G5iqxISfS47opubfXB/oU5Rt+uXRkZkBZbPHfwsGetnzlHyTNmHlz
         ofPH5+63lE2ConObOk2Xj3CwxxWJj0LNWI+bIE64Fsfv0gWEdz7G68q+JQVsNs5Ubjvw
         vKVA==
X-Gm-Message-State: AOAM531x1f0ZyJlRwqDmn9kVgINSQbQm0i7LFOkLz76GQhVzJl9chJrf
        47xctjMKqp6HgHFVvfMFYOdRZw==
X-Google-Smtp-Source: ABdhPJxBVOpPUN0GrXqvgH2LOnRDqzazuwBwLrPczcKZE5ePwL8OwqqdGAs/Ohdb2B4RPWXhvas7fQ==
X-Received: by 2002:a17:90a:be0e:: with SMTP id a14mr3074347pjs.105.1629196963801;
        Tue, 17 Aug 2021 03:42:43 -0700 (PDT)
Received: from google.com ([2409:10:2e40:5100:8aab:cb84:5fe8:99dd])
        by smtp.gmail.com with ESMTPSA id h25sm2188032pfo.68.2021.08.17.03.42.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Aug 2021 03:42:43 -0700 (PDT)
Date:   Tue, 17 Aug 2021 19:42:38 +0900
From:   Sergey Senozhatsky <senozhatsky@chromium.org>
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc:     Sergey Senozhatsky <senozhatsky@chromium.org>,
        Tomasz Figa <tfiga@chromium.org>,
        Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
        Ricardo Ribalda <ribalda@chromium.org>,
        Christoph Hellwig <hch@lst.de>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCHv4 5/8] videobuf2: add V4L2_MEMORY_FLAG_NON_COHERENT flag
Message-ID: <YRuSnhFwqho7YasH@google.com>
References: <20210727070517.443167-1-senozhatsky@chromium.org>
 <20210727070517.443167-6-senozhatsky@chromium.org>
 <45dbd3f1-778b-eb6c-94b3-51e8a92429b6@xs4all.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <45dbd3f1-778b-eb6c-94b3-51e8a92429b6@xs4all.nl>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On (21/08/03 10:12), Hans Verkuil wrote:
> On 27/07/2021 09:05, Sergey Senozhatsky wrote:
> > By setting or clearing V4L2_MEMORY_FLAG_NON_COHERENT flag
> 
> clearing -> clearing the
> 
> > user-space should be able to hint vb2 that either a non-coherent
> 
> either a -> either

Done, thanks.
