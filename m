Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C5DA01F7CED
	for <lists+linux-media@lfdr.de>; Fri, 12 Jun 2020 20:33:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726275AbgFLSdp (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 12 Jun 2020 14:33:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37102 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726085AbgFLSdo (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 12 Jun 2020 14:33:44 -0400
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com [IPv6:2a00:1450:4864:20::529])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A4456C03E96F
        for <linux-media@vger.kernel.org>; Fri, 12 Jun 2020 11:33:44 -0700 (PDT)
Received: by mail-ed1-x529.google.com with SMTP id m21so7094288eds.13
        for <linux-media@vger.kernel.org>; Fri, 12 Jun 2020 11:33:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=q7SrjVqVBTDVCWZmoq5uoTeKKp+YP3TsSad+GNKJpV8=;
        b=cZW7SncqKz7jqf9xP4wJfA1dLkNwlB8DBWwXRqdrodvYWgpKyBHM02hG7EVuklqWAw
         UBDcMfZdFrCXwigDUX++WRU8WmQ/IOwYvpKWbXRrk40zO99eQDUJT0XKKexaNKjT+LIP
         u8Tzuip4ran883lY3vAUlW1pdHotV77+WNdpE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=q7SrjVqVBTDVCWZmoq5uoTeKKp+YP3TsSad+GNKJpV8=;
        b=Ca+KW1YAenHizDhy22OQGbp3DESnes5RHFmOxdDWt3UnxA5Et0FJcZbqORl+k/akEq
         W5CbyoApf4ZjLQsRsB24mMXkgiEC8jD2TFpnGXxXuVxWPPvIZm50S0y3Vb1+/bMTSHWQ
         +luvKdn+xVmp8KKQmG5UJvLWzvP3nrdc+iDZBZUehZ4zYn5r4BqV20yw4pFTEpmT2Ejw
         bAmDwIZ4aeX/CqIgDQPLU66oKcIqjYFZ3oTljQeCvJUNtj2SuoapqDNryJdOuFzvZH/3
         fbotWo1ZeCUFj9hFFaztN8dg/oi+k6ifDMN7cctnSIaYdNHqR5/8uwt6ApHNNGeTSNO7
         finw==
X-Gm-Message-State: AOAM533F8OAVN87ytO63tuildMJWTHIdRD+bogOaz4QicmM8U95QAP4J
        8wq1NQfvyYWVyPUcFBNOFGwt9s0vZZYHhw==
X-Google-Smtp-Source: ABdhPJz05KyPL/uSvAtkooeeEMPJiJmb44chHKxEMBfwhmRZOZvBrrxffFCzV24/Qk/ynhfw1+udog==
X-Received: by 2002:a50:fb92:: with SMTP id e18mr12493346edq.135.1591986822815;
        Fri, 12 Jun 2020 11:33:42 -0700 (PDT)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com. [209.85.221.47])
        by smtp.gmail.com with ESMTPSA id y26sm3493110edv.91.2020.06.12.11.33.41
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 12 Jun 2020 11:33:42 -0700 (PDT)
Received: by mail-wr1-f47.google.com with SMTP id c3so10651988wru.12
        for <linux-media@vger.kernel.org>; Fri, 12 Jun 2020 11:33:41 -0700 (PDT)
X-Received: by 2002:adf:9c12:: with SMTP id f18mr17545158wrc.105.1591986821298;
 Fri, 12 Jun 2020 11:33:41 -0700 (PDT)
MIME-Version: 1.0
References: <5408d9f1-6415-7089-8069-ec36cd9eed75@linaro.org>
In-Reply-To: <5408d9f1-6415-7089-8069-ec36cd9eed75@linaro.org>
From:   Tomasz Figa <tfiga@chromium.org>
Date:   Fri, 12 Jun 2020 20:33:28 +0200
X-Gmail-Original-Message-ID: <CAAFQd5ADxz-GYYiocKcB+Qxk9_tNJ_aAMxoOY6N9NLC-6ya3pw@mail.gmail.com>
Message-ID: <CAAFQd5ADxz-GYYiocKcB+Qxk9_tNJ_aAMxoOY6N9NLC-6ya3pw@mail.gmail.com>
Subject: Re: reqbuf(count=0), new vb2 op or something else
To:     Stanimir Varbanov <stanimir.varbanov@linaro.org>
Cc:     Linux Media Mailing List <linux-media@vger.kernel.org>,
        Hans Verkuil <hverkuil@xs4all.nl>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Stanimir,

On Fri, Jun 12, 2020 at 5:20 PM Stanimir Varbanov
<stanimir.varbanov@linaro.org> wrote:
>
> I failed to found previous discussion on the subject, maybe it was on IRC.
>
> I stuck with fixing of issues which depends on this reqbuf(count=0).
> Currently I'm counting the buffers in vb2::buf_init and vb2::buf_cleanup
> but I don't want to rely on that implicit way anymore.
>
> If someone of you can remember let me know so that I can prepare an RFC.
>
> I can think of two options:
>  - change vb2::queue_setup so it could be called with num_buffers=0
>  - add new vb2::queue_release op
>
> More options?

Just to make sure we're on the same page: Are you looking for a way to
handle some operation only when all buffers on the queue are being
freed?

Best regards,
Tomasz
