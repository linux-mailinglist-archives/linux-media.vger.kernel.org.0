Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 17A4939AD80
	for <lists+linux-media@lfdr.de>; Fri,  4 Jun 2021 00:15:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230390AbhFCWRJ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 3 Jun 2021 18:17:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33396 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230340AbhFCWRJ (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 3 Jun 2021 18:17:09 -0400
Received: from mail-pg1-x535.google.com (mail-pg1-x535.google.com [IPv6:2607:f8b0:4864:20::535])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 401E2C061756
        for <linux-media@vger.kernel.org>; Thu,  3 Jun 2021 15:15:14 -0700 (PDT)
Received: by mail-pg1-x535.google.com with SMTP id o9so3400554pgd.2
        for <linux-media@vger.kernel.org>; Thu, 03 Jun 2021 15:15:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=Xlh/oNiO3TZl/popVg/iq16H/seu6puB9V0a6+PnUTA=;
        b=ii2flrQzSCfBbiKjmatRgjNHRcy4XbdREu4axA/t8CDmXw7J+p7pAHClIv19jO0kjq
         +scvaH0csxFb6xSmioqJuWkhfeE+B9h5NzZqFeQYUhDFPT9bVbXHUMr31H/9MaDFXX+8
         oDM9ZLmBLYKXZDlu7Se7l2D+oAWPTtQP2h3kI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=Xlh/oNiO3TZl/popVg/iq16H/seu6puB9V0a6+PnUTA=;
        b=qwqLxVTH0vga8A6KB1aBEsGJw00E+sQJvqXOd0k2M6/nkL9b/uczMmD0XTgUtLtf9C
         VK7Ci+L0S7j2U3Dr7pcIX1CO+jQb0Ht6ga8Cw9linX0cTZ/dIfDpuziezsL21QRxVulo
         afmbsD18JkCYlTgvwtYgCyxLTpHBR1p9MIo3JmlaXJhn9A/+R0amvVNnOFY4sL4U2k/r
         U4FF2cjpkmrlMbPZP1LJN1DU+hGRfeuh0UjXB7UztF9Xy6YUWW28LjwkXhyDfbq8uLgx
         vQxJbN/outOifgzJuDwbrvIPESphst8fDSYcb8TcCuCnbnFIfDWDJ2UPIWrcjOVgsgA7
         o4zw==
X-Gm-Message-State: AOAM533vTg0Uu8zKtNHbONxISVUuxm95P5D1MnLoyNVIMbNLQZOIbbIM
        giRrCyNvG9Epm9Xg/P9Dsfijrg==
X-Google-Smtp-Source: ABdhPJz3UbVmJ50yQ1P/8llEFze5hkwDfxdoPLS+Dr46FFuRdBotkg/2pP/9HTXF3ybsg51Jw2fW3A==
X-Received: by 2002:a63:d754:: with SMTP id w20mr1648264pgi.5.1622758511958;
        Thu, 03 Jun 2021 15:15:11 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id j3sm66799pfe.98.2021.06.03.15.15.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Jun 2021 15:15:11 -0700 (PDT)
Date:   Thu, 3 Jun 2021 15:15:09 -0700
From:   Kees Cook <keescook@chromium.org>
To:     "Gustavo A. R. Silva" <gustavoars@kernel.org>
Cc:     Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org
Subject: Re: [PATCH v3][venus-for-next-v5.14] media: venus: hfi_cmds: Fix
 packet size calculation
Message-ID: <202106031514.BA827D5@keescook>
References: <20210603001708.GA55239@embeddedor>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210603001708.GA55239@embeddedor>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Jun 02, 2021 at 07:17:08PM -0500, Gustavo A. R. Silva wrote:
> Now that a one-element array was replaced with a flexible-array member
> in struct hfi_sys_set_property_pkt, use the struct_size() helper to
> correctly calculate the packet size.
> 
> Fixes: 701e10b3fd9f ("media: venus: hfi_cmds.h: Replace one-element array with flexible-array member")
> Signed-off-by: Gustavo A. R. Silva <gustavoars@kernel.org>

Thanks for the update!

Reviewed-by: Kees Cook <keescook@chromium.org>

-- 
Kees Cook
