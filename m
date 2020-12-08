Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9CEFD2D3013
	for <lists+linux-media@lfdr.de>; Tue,  8 Dec 2020 17:45:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730494AbgLHQoR (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 8 Dec 2020 11:44:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58468 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730227AbgLHQoR (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 8 Dec 2020 11:44:17 -0500
Received: from mail-qk1-x733.google.com (mail-qk1-x733.google.com [IPv6:2607:f8b0:4864:20::733])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2E70DC0617A7
        for <linux-media@vger.kernel.org>; Tue,  8 Dec 2020 08:43:31 -0800 (PST)
Received: by mail-qk1-x733.google.com with SMTP id z188so16489478qke.9
        for <linux-media@vger.kernel.org>; Tue, 08 Dec 2020 08:43:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20150623.gappssmtp.com; s=20150623;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=sBS4blly5ftspXN9ST0DLHMREtfGyC++Id2+8zhjIow=;
        b=UX9pWQlJB8S2vet8AGZdg60ZBGx40zwYKL3NTG/r53EMtFwQDhZY4jHus3F/6DDayR
         Ln9C8Hf05knH90+UldDtwEemuya+rE109TNRqR/mpKrGrbssJyHndFeRLYSYm+SZ/MFs
         aFh9ynRjlkXvhuoIwmlzfHflzXcpSo51HBnhznl2E4WmrfJD7j3L6K7xr2WiiROZMs3Y
         DYaOeQunYEPuIj78sDSxiLoZnI2egr5fQFRCA8y8Cvu//kRa1MsR3YlLEsnnQ6dpuL3M
         I0TvacAz3KuhrDzHc7wlctsynFFO53l6EFutc2yERtcJuJ+tG/McGKvk9A4ixqeo2O6q
         3YJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=sBS4blly5ftspXN9ST0DLHMREtfGyC++Id2+8zhjIow=;
        b=T9uj4aixDFMjND57V97iwR1Vq9pUv8Jerz3RxasvH67QYFBQlb2r6bifQBhOjjZjtL
         lsbkpO+u0Gc8pTdtYqihhCLTxqaFcGfgwed+e7Y5bzXvqxx2WJpvt3uxz1TCGO5nl0Ox
         0QGL01HeTuF81+1klzyHw4mL0v3VczWVwfME5fHIp+36Ge1InFvgBql4T4jnSB7nUkRS
         zeSV6BMRctEIwpwjHP80WfNmA/ni2WTyGQtf/xb8xUsJ+IMtjR1MTtBgJlsHm9ufvGHF
         ukehXypq6Qw3RmD7YF1lwcgdCzTIkyHBe0OvYAtxRzmeSAnmX41/e9+TMgiWRyqx2Q9H
         mrBA==
X-Gm-Message-State: AOAM532GLd08hJ+uWxE7syPXUa7QY5QUGrUv3VBmL7Wt9amyz5RsolUf
        +DGtaJpEa8GVbnFGwSYqHQfa7Q==
X-Google-Smtp-Source: ABdhPJwbyZwMjvM7nCMKeJvQBjFeravKFbd/FYFRqoLOkmtgz2zYRvYqieWwxQv1FYy46zO+gaLAHA==
X-Received: by 2002:a05:620a:22e7:: with SMTP id p7mr31955964qki.333.1607445810441;
        Tue, 08 Dec 2020 08:43:30 -0800 (PST)
Received: from nicolas-tpx395.lan (173-246-12-168.qc.cable.ebox.net. [173.246.12.168])
        by smtp.gmail.com with ESMTPSA id v204sm14987314qka.4.2020.12.08.08.43.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Dec 2020 08:43:29 -0800 (PST)
Message-ID: <3d557792606109728235db6b1a15d7313cce4096.camel@ndufresne.ca>
Subject: Re: How to get last frames in encode sequence returned by v4l2
 encoder driver without V4L2_ENC_CMD_STOP
From:   Nicolas Dufresne <nicolas@ndufresne.ca>
To:     Hirokazu Honda <hiroh@chromium.org>,
        Alexandre Courbot <acourbot@chromium.org>
Cc:     linux-media@vger.kernel.org, Tomasz Figa <tfiga@chromium.org>,
        Fritz Koenig <frkoenig@chromium.org>,
        J Kardatzke <jkardatzke@chromium.org>
Date:   Tue, 08 Dec 2020 11:43:28 -0500
In-Reply-To: <CAO5uPHNGNwXadtRY6CYghsCYaPNCxOkxYR98CYvPfF0ZrqSPHw@mail.gmail.com>
References: <CAO5uPHN-30N8Hv8exx6bzMQQDbLGJpfQobZ_pzDtqC83k3nCMQ@mail.gmail.com>
         <CAPBb6MXQjG8p2dh9T+GpFncu8WAUwjsWw=ggSMW7QdP0NQrskQ@mail.gmail.com>
         <CAO5uPHNGNwXadtRY6CYghsCYaPNCxOkxYR98CYvPfF0ZrqSPHw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.38.1 (3.38.1-1.fc33) 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Le vendredi 27 novembre 2020 à 03:13 +0900, Hirokazu Honda a écrit :
> HI Alexandre,
> 
> On Tue, Nov 24, 2020 at 7:17 PM Alexandre Courbot <acourbot@chromium.org>
> wrote:
> > 
> > Hi Hiro,
> > 
> > On Fri, Nov 13, 2020 at 6:04 PM Hirokazu Honda <hiroh@chromium.org> wrote:
> > > 
> > > Hi,
> > > 
> > > According to the official v4l2 encoder driver usage description [1],
> > > v4l2 steatful encoder driver doesn't have a guarantee when frames fed
> > > to a driver will be returned.
> > > To make sure all pending frames are output by the driver, an app must
> > > call VIDIOC_ENCODER_CMD with cmd=V4L2_ENC_CMD_STOP.
> > > However, it is not mandatory to support the command in the current
> > > v4l2 stateful encoder API specification.
> > > An app can check it by VIDIOC_TRY_ENCODER_CMD beforehand.
> > > My question is when an app has to get all the frames of an encoder
> > > sequence, how we can achieve this without V4L2_ENC_CMD_STOP support.
> > > This demand is natural and in fact WebCodecs [2] requires this.
> > > 
> > > I think there are two options,
> > > 1.) Ensure that a driver will eventually output frames if it doesn't
> > > support V4L2_ENC_CMD_STOP.
> > > 2.) Change V4L2_ENC_CMD_STOP support to be mandatory
> > 
> > Unless I am missing the part of the spec that says the contrary,
> > V4L2_ENC_CMD_STOP is part of the encoder specification, and thus is
> > mandatory. Some older drivers might not have support for it, in such
> > cases the correct course of action would be to fix them.
> > 
> 
> I researched the API documents.
> The statement that the support is mandatory to stateful encoders is
> added from the latest document v5.9 [1],
> It states optional in the API document of v4.19 and v5.8.
> Hence my question is obsolete.
> 
> [1] 
> https://www.kernel.org/doc/html/v5.9/userspace-api/media/v4l/vidioc-encoder-cmd.html
> [2] 
> https://www.kernel.org/doc/html/v4.19/media/uapi/v4l/vidioc-encoder-cmd.html
> [3] 
> https://www.kernel.org/doc/html/v5.8/userspace-api/media/v4l/vidioc-encoder-cmd.html?highlight=v4l2_enc_cmd_stop

In historical drivers (Samsung MFC and perhaps Venus ?) an empty payload buffer
was used to signal draining. This approach was never documented and had issues.
It is still supported by MFC driver so that older Chromium / Android code don't
fail on it (even though I doubt it has ever been retested since).

> 
> Best Regards,
> -Hiro
> > > 
> > > Any comments are appreciated.
> > > Thanks so much in advance.
> > > 
> > > [1] 
> > > https://www.kernel.org/doc/html/latest/userspace-api/media/v4l/dev-encoder.html#drain
> > > [2] https://web.dev/webcodecs/
> > > 
> > > Sincerely,
> > > -Hiro


