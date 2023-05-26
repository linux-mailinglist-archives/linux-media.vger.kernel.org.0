Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0D98C712C01
	for <lists+linux-media@lfdr.de>; Fri, 26 May 2023 19:43:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242778AbjEZRny (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 26 May 2023 13:43:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52500 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236867AbjEZRnw (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 26 May 2023 13:43:52 -0400
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com [IPv6:2607:f8b0:4864:20::1036])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2F819E7
        for <linux-media@vger.kernel.org>; Fri, 26 May 2023 10:43:51 -0700 (PDT)
Received: by mail-pj1-x1036.google.com with SMTP id 98e67ed59e1d1-25345ca8748so1095707a91.1
        for <linux-media@vger.kernel.org>; Fri, 26 May 2023 10:43:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1685123030; x=1687715030;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=hg9Y1Zeqm2LukQubiT8t4V/vqubtiFOiCTgTYUMaUVs=;
        b=lta3MXHxjS1c7AJAUPLUOeHcr5x4Zo3I0sh7vWvpASJEc8uOh/eMfflNOlqqurTpiC
         y1tn4GMr/aIo9mLeE/wroXnkfagYh0cxm5KsTTxf2BD+1Xlltby4ztTCm4k6kClJA5qo
         sIYWv8PJerV3mljMW1vWIqC1jQcttRocREL9A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685123030; x=1687715030;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hg9Y1Zeqm2LukQubiT8t4V/vqubtiFOiCTgTYUMaUVs=;
        b=WlYQ9o3I0TWtI81Wl+gDcK3gFgcCTEaTf+rzSXPykFg9cjvwquFbQdckoDqV8G95aY
         99Svx2iHnMk9N8U4dnRiKQ4dYAaKhwh13rfwnz/z2fTljxLHACMIXFal65SdGIZuMchC
         Ud70m0ovs0uHBurO9GVCsFDvHlEAfqjEJlDw/mT5uQ+0nOxdwVMvVMepN23Me/2NcZ2J
         hBUjFSIGG8n2L5iaKILgCkKfBGY8jsNX7l5OmRRw0faVSTfQl6z3L2a+IKcF4UjiRQJN
         72LP1OlHW44yr42Dm8ISZ6umjkedi9KQaWyI/95NliQLy9TDT+kOs85cUu5nHPONKK+o
         VssQ==
X-Gm-Message-State: AC+VfDyMEkFX2iOJaKa75/rNTT2ITV9GbpTloE9Jc66dx6nK7EznLgE4
        tSyqAgRzKtRlTVCJ84WQueWgDYIm9IcJlUT0jXo=
X-Google-Smtp-Source: ACHHUZ7/7bJzxKpXODcLcQHpGpV/j9si5r5SwPI1mqbMjnGFBZlzEi+VmgCEu3f6lGaHSTOA1ark4A==
X-Received: by 2002:a17:90a:55c9:b0:253:27b4:cd4d with SMTP id o9-20020a17090a55c900b0025327b4cd4dmr2849789pjm.27.1685123030618;
        Fri, 26 May 2023 10:43:50 -0700 (PDT)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net. [198.0.35.241])
        by smtp.gmail.com with ESMTPSA id 127-20020a630385000000b0051b5d0fe708sm3074081pgd.43.2023.05.26.10.43.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 May 2023 10:43:50 -0700 (PDT)
Date:   Fri, 26 May 2023 10:43:49 -0700
From:   Kees Cook <keescook@chromium.org>
To:     "Gustavo A. R. Silva" <gustavoars@kernel.org>
Cc:     Andy Walls <awalls@md.metrocast.net>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-hardening@vger.kernel.org
Subject: Re: [PATCH][next] media: pci: cx18-av-vbi: Replace one-element array
 with flexible-array member
Message-ID: <202305261043.A86E75BD5B@keescook>
References: <ZG1YVji9thTLWeRm@work>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZG1YVji9thTLWeRm@work>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, May 23, 2023 at 06:20:38PM -0600, Gustavo A. R. Silva wrote:
> One-element arrays are deprecated, and we are replacing them with flexible
> array members instead. So, replace one-element arrays with flexible-array
> members in struct vbi_anc_data.
> 
> This results in no differences in binary output.
> 
> Link: https://github.com/KSPP/linux/issues/79
> Signed-off-by: Gustavo A. R. Silva <gustavoars@kernel.org>

Reviewed-by: Kees Cook <keescook@chromium.org>

-- 
Kees Cook
