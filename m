Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 67C046A8D6
	for <lists+linux-media@lfdr.de>; Tue, 16 Jul 2019 14:39:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727849AbfGPMjG (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 16 Jul 2019 08:39:06 -0400
Received: from mail-io1-f66.google.com ([209.85.166.66]:41959 "EHLO
        mail-io1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726997AbfGPMjF (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 16 Jul 2019 08:39:05 -0400
Received: by mail-io1-f66.google.com with SMTP id j5so35413474ioj.8
        for <linux-media@vger.kernel.org>; Tue, 16 Jul 2019 05:39:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=4+uKVxRG12YnMo+nxqmAdhMwOt87eXTPgYKwD/FAkMY=;
        b=aWm3FdKNwOrc+L6x4sb57YvqkZZZbZGR7CMtBC+wI+LWAtzO9nqUwkjvBPDNdPmi9/
         ZMYTm14AI/KvT/b4gApMoglI65DP7Nx7L4n/sxr+zaNdjNjzVxB52fgywBRJRfi9XQS2
         i7/70WmCJ7ePIUbaRSfkM4tpYTiTCM502Vw1rWkVV/hibJaEFIgFKOFXbrPK54qmgtg8
         svbQkuHJ9eyDR/8CRVv2gyNAO5GV3Gu7XQyFnkvEXRDGZAY247EdUNWU7eJuZYMV4oiM
         DckRQ4IxKpqOinkyHrGQRS2dsPG0Oo/esp0uTA7iG7FpEm+YOrmEu+3XHXptwzu97elL
         ObSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=4+uKVxRG12YnMo+nxqmAdhMwOt87eXTPgYKwD/FAkMY=;
        b=R6Mout7NEFRcTVIu0GcWZSy820wDL32sGzs0nM8B2lN3J/4xlf8DCGSnXw36YUvkVV
         tMwSwbbvG7xDKyDNQdNoq+RVX2k7lQ+smKv31Zy4p8GxRNEzq9DzfntKJai35o+p4Ymn
         P9NMOdJsg99SjKyaWBhNJZO3GoH3gf2/KmtspdT8WaMZP0xC+mfJFV8jraG/xpEwwrs4
         RvqeAOY2hcbh3a5LYJqV1F/3O0ETrzNOjyqtn7taUYUg8ixXAP4KyYdicSGS8jFUzSiz
         BguyXjCxnvhDI9Y9XNiT7Mtv4AJZEdRbGIPVskNPqKFBXWigV0e7DIAmMxa56lE0901K
         3OEA==
X-Gm-Message-State: APjAAAVpcU+l+dG3PdjSViy/N+r4irxKfEFfvDya7VvwPSjrpFxJyrb3
        /a7zA6oaOpLBUku7bH6GGg9mhFj0Ce9XhxjaWP8k1Q==
X-Google-Smtp-Source: APXvYqynpYITjw8ZRBkDYHQSlGGxnvNiBz6c476Abud41S9t0R6XG3+YG7QLN6oo2bdUi7j7JPxl5OKpaEexJXtkBjg=
X-Received: by 2002:a5d:9c12:: with SMTP id 18mr31238100ioe.48.1563280744740;
 Tue, 16 Jul 2019 05:39:04 -0700 (PDT)
MIME-Version: 1.0
References: <20190716075820.260202-1-darekm@google.com> <20190716075820.260202-4-darekm@google.com>
 <7055d5ca-95cd-2cae-9d88-fff16a51285c@xs4all.nl>
In-Reply-To: <7055d5ca-95cd-2cae-9d88-fff16a51285c@xs4all.nl>
From:   Dariusz Marcinkiewicz <darekm@google.com>
Date:   Tue, 16 Jul 2019 14:38:53 +0200
Message-ID: <CALFZZQF4W42LDz0ux9cmDoVdrojO3+uMK4uD63aUEwb2Q3ebjQ@mail.gmail.com>
Subject: Re: [PATCH v3 3/9] dw-hdmi-cec: use cec_notifier_cec_adap_(un)register
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc:     linux-media@vger.kernel.org, Hans Verkuil <hverkuil@xs4all.nl>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, Jul 16, 2019 at 10:48 AM Hans Verkuil <hverkuil-cisco@xs4all.nl> wrote:
...
> > @@ -297,8 +298,6 @@ static int dw_hdmi_cec_probe(struct platform_device *pdev)
> >        */
> >       devm_remove_action(&pdev->dev, dw_hdmi_cec_del, cec);
>
> I have to say that I find this remove action very confusing since it is
> not obvious that this deletes the adapter on error. I would prefer that
> the action is dropped and the normal 'goto' pattern is used for error
> handling. Much easier to review.
>
> What do you think?
>
This pattern indeed seems uncommon - there are only a couple of
references to devm_remove_action in the kernel, if I am counting this
right. I am not sure, though, if this patch is the right place to make
changes to the way resources are unwound.

Regards.
