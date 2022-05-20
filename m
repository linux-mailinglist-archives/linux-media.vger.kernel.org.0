Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 06F7052E229
	for <lists+linux-media@lfdr.de>; Fri, 20 May 2022 03:50:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344596AbiETBuE (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 19 May 2022 21:50:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45282 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240672AbiETBuC (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 19 May 2022 21:50:02 -0400
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com [IPv6:2607:f8b0:4864:20::1032])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D64BFDE327
        for <linux-media@vger.kernel.org>; Thu, 19 May 2022 18:50:00 -0700 (PDT)
Received: by mail-pj1-x1032.google.com with SMTP id fw21-20020a17090b129500b001df9f62edd6so5499343pjb.0
        for <linux-media@vger.kernel.org>; Thu, 19 May 2022 18:50:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=bSYkUjPvAsu074e/VjNGWfjNftItgD9OU7BKxmchNu0=;
        b=IctWEQwULe+HOgPbU7d0NJ3bNOOh3R/ed9A6ET0Gs/piG+Bes/Utvzo/JOuyGD8RRU
         RcDWQ8n8fK3gVNdg7zOFFUdQGbLx/Yeu4mzOrLYeaNU76aARYW0jjqtvRRXuDmBVfrna
         g7qU8icOdLj7kU6hSvSdtAKN4mYIBgh28Dejc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=bSYkUjPvAsu074e/VjNGWfjNftItgD9OU7BKxmchNu0=;
        b=gUoj0Vkm6rGLgF2iAJCZ5iCzK1Ru2+md3gfwcpviU+6SB1OMIhR5ug3ghvCjEKvK7K
         gp1X8mSgAEPuFioJo6N6a50m649PeDa3QhTojZvX0XxJhRmr0Z/VPuDocNk3YpgK6Fp1
         6fUvTY9rU7x9AEYB+6UA37Ba9b239s5hlnlr07zPbdhtblB7sf40BSQZH9l1mkwdAmcM
         BisOS3ZSte5cp+Mm/V0iYfAJ+a1nSU+xTgGrqAsqSbNDDCgbCbZQwF+Do86Abu/8uIzb
         /IAYR1ZZYJGOWJISATNbkKa0hJ7mP3VxzD989+Ph3jMPwRRjNqxRJkD0DcPr2Z2bWN6j
         l5CA==
X-Gm-Message-State: AOAM531CYH+/CiwZxf1HL7jp16bD/w5yTtD/MJkAUROkcAAjOdHO+0lJ
        iiAuaV6SPRDskfJnshoXI/MwxQ==
X-Google-Smtp-Source: ABdhPJxYCaKfJrQpyhnMwy4bw/c5zkQ+q174lh8wbUasjk9l4ZAUxrQCXZ8SzukBnlB3+yq5G+ayIg==
X-Received: by 2002:a17:902:9887:b0:151:6e1c:7082 with SMTP id s7-20020a170902988700b001516e1c7082mr7427960plp.162.1653011400364;
        Thu, 19 May 2022 18:50:00 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id a23-20020a056a001d1700b0050dc76281ddsm329776pfx.183.2022.05.19.18.49.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 May 2022 18:50:00 -0700 (PDT)
Date:   Thu, 19 May 2022 18:49:59 -0700
From:   Kees Cook <keescook@chromium.org>
To:     Kalesh Singh <kaleshsingh@google.com>
Cc:     ilkos@google.com, tjmercier@google.com, surenb@google.com,
        kernel-team@android.com, Jonathan Corbet <corbet@lwn.net>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Christoph Anton Mitterer <mail@christoph.anton.mitterer.name>,
        Mike Rapoport <rppt@kernel.org>,
        Colin Cross <ccross@google.com>,
        Randy Dunlap <rdunlap@infradead.org>,
        linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-media@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org
Subject: Re: [RFC PATCH] procfs: Add file path and size to /proc/<pid>/fdinfo
Message-ID: <202205191848.DEE05F6@keescook>
References: <20220519214021.3572840-1-kaleshsingh@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220519214021.3572840-1-kaleshsingh@google.com>
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, May 19, 2022 at 02:40:15PM -0700, Kalesh Singh wrote:
> [...]
> +	seq_file_path(m, file, "\n");
> +	seq_putc(m, '\n');
>  
>  	/* show_fd_locks() never deferences files so a stale value is safe */
>  	show_fd_locks(m, file, files);

This comment implies "file" might be stale? Does that mean anything for
the above seq_file_path()?

-- 
Kees Cook
