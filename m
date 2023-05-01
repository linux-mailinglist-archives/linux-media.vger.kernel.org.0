Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7F9006F3199
	for <lists+linux-media@lfdr.de>; Mon,  1 May 2023 15:44:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232517AbjEANoV (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 1 May 2023 09:44:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59958 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232208AbjEANoU (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 1 May 2023 09:44:20 -0400
Received: from mail-pf1-x435.google.com (mail-pf1-x435.google.com [IPv6:2607:f8b0:4864:20::435])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 10566A4
        for <linux-media@vger.kernel.org>; Mon,  1 May 2023 06:44:19 -0700 (PDT)
Received: by mail-pf1-x435.google.com with SMTP id d2e1a72fcca58-642f5394651so99853b3a.3
        for <linux-media@vger.kernel.org>; Mon, 01 May 2023 06:44:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1682948658; x=1685540658;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=M5Nq4B26qJ9uXEAUYfro1DC0jOlI4nlPKmZK39ZdWy8=;
        b=QkYy5wO4JEnWm9nXNGU3yPmpx1HEdA6JFr+fHewnB7AeRtlc5eBVOR7w0n541Lz6eh
         ua/e1b2DyvBdC4+O3Y+R3tUPBpZHz9smrue3NsyJBSQOzjBXtO6Ku/9qRm7z8jVz0Exx
         db/Wu/EsWPGf+04ROUtC66aal+rY4QxqbQkUo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682948658; x=1685540658;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=M5Nq4B26qJ9uXEAUYfro1DC0jOlI4nlPKmZK39ZdWy8=;
        b=K3U1Kax/NkPOwX3AHd3chVsid+82VACZeSmjlUXie88dOv6coWE/YFkAMHUhf+jZp3
         7riWlF4jORQccvznUupptLWV7fdC1P3zUKPF0/5i2S06fIj0X9GJHS13rxc9hwsAA0Cm
         AhVqoeeq8FrjAAcp0cnATg3aD0LRoiT7395Y6bLWulbtyXaqPOvls8H92IcO9O21GT8l
         mK/H9C8lqVaNPRcQP9wb6UUbxu+5cPcjxEue/xN+24c9X+xUhxavzkBibcYeVugTyuTj
         UR2GGQnn2F8M5/m51dLAdvnL0Vb5eAQ+QaTyRd9WaJujsLHO4ZXnVR3xT/vJ3j1dvEoG
         1yFg==
X-Gm-Message-State: AC+VfDyiViXdty1bpNjWfxc6xorXwV5WM/3LETcWXhq1Q7bDZBFS0glW
        AdLpqU3vhX41++q+I+t8FU4LbGzuo0Hya42YwCNDDg==
X-Google-Smtp-Source: ACHHUZ69uG/iJqdC0GL/V/bEx0QZWsWS/HBh49aN0AMcftLpNqog8RmxdFuF/44Lv88mwD1S98kC1w==
X-Received: by 2002:a05:6a00:1301:b0:641:699:f34c with SMTP id j1-20020a056a00130100b006410699f34cmr21063413pfu.17.1682948658232;
        Mon, 01 May 2023 06:44:18 -0700 (PDT)
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com. [209.85.210.179])
        by smtp.gmail.com with ESMTPSA id j23-20020aa78d17000000b006414b2c9efasm3611156pfe.123.2023.05.01.06.44.17
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 01 May 2023 06:44:17 -0700 (PDT)
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-642f5394651so99839b3a.3
        for <linux-media@vger.kernel.org>; Mon, 01 May 2023 06:44:17 -0700 (PDT)
X-Received: by 2002:a17:902:cece:b0:1ab:605:1b6b with SMTP id
 d14-20020a170902cece00b001ab06051b6bmr99392plg.48.1682948657218; Mon, 01 May
 2023 06:44:17 -0700 (PDT)
MIME-Version: 1.0
References: <20230420100958.10631-1-laurent.pinchart@ideasonboard.com> <20230420100958.10631-5-laurent.pinchart@ideasonboard.com>
In-Reply-To: <20230420100958.10631-5-laurent.pinchart@ideasonboard.com>
From:   Ricardo Ribalda <ribalda@chromium.org>
Date:   Mon, 1 May 2023 15:44:06 +0200
X-Gmail-Original-Message-ID: <CANiDSCu=_qmCe6L6nTE+Fx+9POjpOPVsoO2Wq0+ZTprzruGt1w@mail.gmail.com>
Message-ID: <CANiDSCu=_qmCe6L6nTE+Fx+9POjpOPVsoO2Wq0+ZTprzruGt1w@mail.gmail.com>
Subject: Re: [PATCH v1 4/4] media: uvcvideo: Constify descriptor buffers
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-media@vger.kernel.org,
        Kieran Bingham <kieran.bingham@ideasonboard.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, 20 Apr 2023 at 12:10, Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> There is no need to modify the content of UVC descriptor buffers during
> parsing. Make all the corresponding pointers const to avoid unintended
> modifications.
>
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Reviewed-by: Ricardo Ribalda <ribalda@chromium.org>
> ---
>  drivers/media/usb/uvc/uvc_driver.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
> index efc7a36a892e..ab7f2a0112d3 100644
> --- a/drivers/media/usb/uvc/uvc_driver.c
> +++ b/drivers/media/usb/uvc/uvc_driver.c
> @@ -221,7 +221,7 @@ static struct uvc_streaming *uvc_stream_new(struct uvc_device *dev,
>
>  static int uvc_parse_format(struct uvc_device *dev,
>         struct uvc_streaming *streaming, struct uvc_format *format,
> -       struct uvc_frame *frames, u32 **intervals, unsigned char *buffer,
> +       struct uvc_frame *frames, u32 **intervals, const unsigned char *buffer,
>         int buflen)
>  {
>         struct usb_interface *intf = streaming->intf;
> @@ -494,7 +494,7 @@ static int uvc_parse_streaming(struct uvc_device *dev,
>         struct uvc_format *format;
>         struct uvc_frame *frame;
>         struct usb_host_interface *alts = &intf->altsetting[0];
> -       unsigned char *_buffer, *buffer = alts->extra;
> +       const unsigned char *_buffer, *buffer = alts->extra;
>         int _buflen, buflen = alts->extralen;
>         unsigned int nformats = 0, nframes = 0, nintervals = 0;
>         unsigned int size, i, n, p;
> @@ -1146,7 +1146,7 @@ static int uvc_parse_standard_control(struct uvc_device *dev,
>  static int uvc_parse_control(struct uvc_device *dev)
>  {
>         struct usb_host_interface *alts = dev->intf->cur_altsetting;
> -       unsigned char *buffer = alts->extra;
> +       const unsigned char *buffer = alts->extra;
>         int buflen = alts->extralen;
>         int ret;
>
> --
> Regards,
>
> Laurent Pinchart
>


-- 
Ricardo Ribalda
