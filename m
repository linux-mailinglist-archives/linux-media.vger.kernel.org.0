Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1AF4E6497A0
	for <lists+linux-media@lfdr.de>; Mon, 12 Dec 2022 02:15:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230452AbiLLBPd (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 11 Dec 2022 20:15:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53170 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229642AbiLLBPb (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 11 Dec 2022 20:15:31 -0500
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com [IPv6:2607:f8b0:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 935FB655C
        for <linux-media@vger.kernel.org>; Sun, 11 Dec 2022 17:15:28 -0800 (PST)
Received: by mail-pl1-x632.google.com with SMTP id 17so3050144pll.0
        for <linux-media@vger.kernel.org>; Sun, 11 Dec 2022 17:15:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=1Q7NSdDI+cBRdy4U2cxwXIHknLHBniGJjnQ4NlM7GlA=;
        b=De9WLIphv5+3yWxA5tUU1WZgh3st56qrLPCXkw4JhpG+RGUVKdvLDKsAWRw7x3qGXb
         h6xKw7/6YFfa9teZUNgqVZ7uvtBIYd6X+/txleT6RyDSuePCiqDr5PlZ0yWlWCVQZvzB
         itirQSTfw6nMpSLevMu8s98RKR2qYzwUd92xg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1Q7NSdDI+cBRdy4U2cxwXIHknLHBniGJjnQ4NlM7GlA=;
        b=xlC4AAAuELwXaD8wnMNnqNFMZvmRNljJi68VL8PteL0lAOCM4+c0puAilf9X1wZde0
         zBRcd9MydnIr+2jdGZFI16D8EaHfIucmpjmBpartlU2zj5IbrogX1l0KCkW08sISqMo6
         5htOetqDJRpbNX1AFQAALZOGfOX+8XkVlfqRxxDDAItoUIh3ZVK08NAatIEKo8IX1Wn1
         XE0fAHJY5rt2OS1laO9vwQABwhHXdHpn1tpIAHI2bNdx6xAJXrG1r6IT++kNmItmgIiY
         NWfdOOu6zVTTg3jZPSJlvXLfGkwTs0ViAkjIDE/XoJHLO5X5JLcdwonY1CTkQvgHp6Jv
         VlEg==
X-Gm-Message-State: ANoB5pmULtDkv/3ZiMNqIlEwyHufPLmxroPNfgothS4VTIrVXXN94UjM
        L84t5czKFUsl3TybboEF8THAQg==
X-Google-Smtp-Source: AA0mqf6PdYEmDNqQaaRQp40o28ze+5hq9qWZnsCRqCLB6ZUMLH3jEZASyPCOIICmh3K2JHQdz2em8A==
X-Received: by 2002:a17:903:4094:b0:189:7548:20a7 with SMTP id z20-20020a170903409400b00189754820a7mr12235364plc.56.1670807728100;
        Sun, 11 Dec 2022 17:15:28 -0800 (PST)
Received: from google.com (KD124209188001.ppp-bb.dion.ne.jp. [124.209.188.1])
        by smtp.gmail.com with ESMTPSA id i133-20020a639d8b000000b004792ff8ab61sm2544334pgd.80.2022.12.11.17.15.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Dec 2022 17:15:27 -0800 (PST)
Date:   Mon, 12 Dec 2022 10:15:22 +0900
From:   Sergey Senozhatsky <senozhatsky@chromium.org>
To:     Ricardo Ribalda <ribalda@chromium.org>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Tomasz Figa <tfiga@chromium.org>,
        Alan Stern <stern@rowland.harvard.edu>,
        linux-kernel@vger.kernel.org, Max Staudt <mstaudt@chromium.org>,
        Sergey Senozhatsky <senozhatsky@chromium.org>,
        Yunke Cao <yunkec@chromium.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        linux-media@vger.kernel.org
Subject: Re: [PATCH v5 1/2] media: uvcvideo: Refactor streamon/streamoff
Message-ID: <Y5aAqoNQeUuwSlQd@google.com>
References: <20220920-resend-powersave-v5-0-692e6df6c1e2@chromium.org>
 <20220920-resend-powersave-v5-1-692e6df6c1e2@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220920-resend-powersave-v5-1-692e6df6c1e2@chromium.org>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On (22/12/06 15:06), Ricardo Ribalda wrote:
> 
> Add a new variable to handle the streaming state and handle the
> streamoff errors, that were not handled before.
> 
> Suggested-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Reviewed-by: Max Staudt <mstaudt@chromium.org>
> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>

Reviewed-by: Sergey Senozhatsky <senozhatsky@chromium.org>
