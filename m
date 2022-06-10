Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B405F546AAF
	for <lists+linux-media@lfdr.de>; Fri, 10 Jun 2022 18:41:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349792AbiFJQjw (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 10 Jun 2022 12:39:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54246 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1349872AbiFJQj0 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 10 Jun 2022 12:39:26 -0400
Received: from mail-pg1-x52b.google.com (mail-pg1-x52b.google.com [IPv6:2607:f8b0:4864:20::52b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 754025710F
        for <linux-media@vger.kernel.org>; Fri, 10 Jun 2022 09:39:22 -0700 (PDT)
Received: by mail-pg1-x52b.google.com with SMTP id g186so16392414pgc.1
        for <linux-media@vger.kernel.org>; Fri, 10 Jun 2022 09:39:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=256cAUtVkFagDS/yqIZzb58j3dk1nOGs4ItV0B+B3cI=;
        b=D3zV7Y1IWSVTJVokfED/63D/2j42lBd46GeSwVKGFKBdfoXZEHxL3cr6zYs0RngV7D
         I47cqKiMrBoDtuOweVBbjjvTV2UimiCGImI6tAQad8Zac33GT/Umx8ULdOgXDKsfcL24
         cfi5tdK4vzvNmxLc5iiyEZjVNjGk7pOSqAi9M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=256cAUtVkFagDS/yqIZzb58j3dk1nOGs4ItV0B+B3cI=;
        b=ZjHpMk13LCcvCU8q3GpAGHw563tY9uQxYUtk9wk/VYet9LM/1aAG632Y7/ulL4GYV/
         k6XZ6LTGVBONk2vAQ3vxoQHKK/v6Cx7cFkmA6C8uB1HHX7jThWdYrRzw6loZG5rO5teB
         yxVp8ZzO+T5JAMqNs/KArJdE5NZRyLfVauKvaXC5IwGtITu5PuZ5FL1yExOUNRBqGRqY
         M0Gvhjd588KRT/Avbh+pBo5QeC8FatPn7uzKft8Ax5pBhJGpOBR/3hrd7Q1PTPm2JQhM
         cZ8Gu8IjdUzU0MaIBihBjAtBYToSWQDRVPonBJctX9mN3IL59TbPwdqy8RiEWqUUOzpO
         3bTQ==
X-Gm-Message-State: AOAM531Z+fTPx2l8BaUEIvDnI/n7RiCRfn1s5gWmJKxL/vRXvRyCywvv
        Z9ISMjae3aU3M/eRj8T/FriW5qXA4/TXXg==
X-Google-Smtp-Source: ABdhPJwxtPN3zU9xrzQM+6wrSyNRdmKkl7p2ded9MNwUAam/BDGtr4NWYxTixwxl9D0Td1pz01r6/g==
X-Received: by 2002:a05:6a00:b41:b0:50d:35fa:476d with SMTP id p1-20020a056a000b4100b0050d35fa476dmr47102208pfo.33.1654879162018;
        Fri, 10 Jun 2022 09:39:22 -0700 (PDT)
Received: from google.com ([2620:15c:202:201:b40f:db8c:1759:e71b])
        by smtp.gmail.com with ESMTPSA id a2-20020a17090a70c200b001e2a36fb4aasm1943824pjm.43.2022.06.10.09.39.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jun 2022 09:39:21 -0700 (PDT)
Date:   Fri, 10 Jun 2022 09:39:19 -0700
From:   Brian Norris <briannorris@chromium.org>
To:     Nicolas Dufresne <nicolas.dufresne@collabora.com>
Cc:     linux-media@vger.kernel.org,
        Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Boris Brezillon <boris.brezillon@collabora.com>,
        kernel@collabora.com,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        linux-rockchip@lists.infradead.org, linux-staging@lists.linux.dev,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 1/5] media: rkvdec: Disable H.264 error detection
Message-ID: <YqNzt9T9BaYu8tgb@google.com>
References: <20220610125215.240539-1-nicolas.dufresne@collabora.com>
 <20220610125215.240539-2-nicolas.dufresne@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220610125215.240539-2-nicolas.dufresne@collabora.com>
X-Spam-Status: No, score=-3.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, Jun 10, 2022 at 08:52:11AM -0400, Nicolas Dufresne wrote:
> Quite often, the HW get stuck in error condition if a stream error
> was detected. As documented, the HW should stop immediately and self
> reset. There is likely a problem or a miss-understanding of the self
> self reset mechanism, as unless we make a long pause, the next command
> will then report an error even if there is no error in it.
> 
> Disabling error detection fixes the issue, and let the decoder continue
> after an error. This patch is safe for backport into older kernels.
> 
> Fixes: cd33c830448b ("media: rkvdec: Add the rkvdec driver")
> Signed-off-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>

This is effectively how ChromeOS previously was using this hardware for
years. When moving to the upstream/staging driver, this started giving
us problems. This fix is helpful; we'd rather sacrifice error detection
for now, to avoid hanging the hardware in error cases ;)

Reviewed-by: Brian Norris <briannorris@chromium.org>
Tested-by: Brian Norris <briannorris@chromium.org>
