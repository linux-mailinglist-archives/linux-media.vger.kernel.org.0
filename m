Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A59A34B6A2
	for <lists+linux-media@lfdr.de>; Wed, 19 Jun 2019 13:05:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731423AbfFSLFY (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 19 Jun 2019 07:05:24 -0400
Received: from mail-io1-f66.google.com ([209.85.166.66]:39947 "EHLO
        mail-io1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727126AbfFSLFY (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 19 Jun 2019 07:05:24 -0400
Received: by mail-io1-f66.google.com with SMTP id n5so37133352ioc.7
        for <linux-media@vger.kernel.org>; Wed, 19 Jun 2019 04:05:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=rCYlhd274MLja1aUjw9jbduFZsTE4iqm0XJqesczC2M=;
        b=uRIbyl+LBSLzrLgEFoRCXr89GPeHdisG96TJxaKDMULVeZsHUdogijixV+ND5zVaqX
         MJVl5pKFkSpIUFYawtVhoagKOYReGf58P5kKHrWQB0sNmS75c+iKdm4YsGisvFLz+gHi
         nOCGvdxlTADF7UIkLMfSOq1pRDe3YHqR1DbU08nx95eTqBsM0Dg4nVtiPpFGWkOZ0O7e
         KC/7kyd5JLcj/Dne4UaPNNjtzozxEhqgDc1TfSVWzrV2TpsRBOmjqu0s+l993ORMyK5R
         ifgZk01ODPnZjlQNqYJdVMFeQEn+P9cbmGapOLUoWemFJ7MAB2ZyRycuZg8/D5tbsSXE
         +WUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=rCYlhd274MLja1aUjw9jbduFZsTE4iqm0XJqesczC2M=;
        b=dVWXyt2j6uUbwqufJ+UA9OmIRPKsGsnPvr+DYWxFUnMU1q1oFijJRQ7lRdfp5N4e0p
         ikWCRXtp6YVUbDxj8XyqB2pzmBvL0aWK/IgrygaphAG3bHYZxuMsmDLCjFhRYuWtpouK
         m9ZiJLYMK7faol6x/lNjEsVcby5HxLKCHy0p4mVJjDrBYviFQk1Q71uaew/d7cM2yssC
         3eCKx+p+p2E8/EYgZ926SOwWM1h6qoy/bpAlfLR3RxP/3eNGVtNb82bx7eZ6EaGH/xAq
         ixHOK305qFEra4l6ylzEgdRM2H+MM4OR8NwtJalAipCl4tC+U0Sxj/uPeqr4p4RQPCmC
         b5VQ==
X-Gm-Message-State: APjAAAULR2ugtVO7RHbwxwcEXWNU2I/BhJct/hBKUZchUOKPhBUb+kEm
        boYE6COD55goCrV5W6jtBJ2cVmZ7dUjduhkYsQOpVg==
X-Google-Smtp-Source: APXvYqzVSJCHAIJzw2Ki3xuEU2OcQ/reJ6yVjoNZ0bCjDZE+rA3BhQAMsiKRSNqwKqr3zDdwk7MKk4vF1gx3otshkzc=
X-Received: by 2002:a5d:8845:: with SMTP id t5mr6046407ios.37.1560942323320;
 Wed, 19 Jun 2019 04:05:23 -0700 (PDT)
MIME-Version: 1.0
References: <20190521105203.154043-1-darekm@google.com> <16889839-b4e9-9984-2e36-5f07ceb7d7f2@xs4all.nl>
In-Reply-To: <16889839-b4e9-9984-2e36-5f07ceb7d7f2@xs4all.nl>
From:   Dariusz Marcinkiewicz <darekm@google.com>
Date:   Wed, 19 Jun 2019 13:05:11 +0200
Message-ID: <CALFZZQEao3vqVxKO-3mT5ATtC=ZWO+bc3dA_Xo-mgpqmna_fMQ@mail.gmail.com>
Subject: Re: [PATCH v7 1/3] media: cec: expose HDMI connector to CEC dev mapping
To:     Hans Verkuil <hverkuil@xs4all.nl>
Cc:     linux-media@vger.kernel.org, hans.verkuil@cisco.com,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Hans.

I would like to come back to this thread.

On Fri, May 24, 2019 at 11:21 AM Hans Verkuil <hverkuil@xs4all.nl> wrote:
>
> Hi Dariusz,
>
> I did some more testing with the Khadas VIM2 and found another problem,
> something that will, unfortunately, require some redesign.
>
> See my comments below...
>
...
>
> Another issue here is that when the HDMI driver removes the notifier,
> then it should also zero the connector info. Remember that both the
> HDMI and the CEC drivers can be loaded and unloaded independently from
> one another.
>

I took a peek at the changes in
https://git.linuxtv.org/hverkuil/media_tree.git/log/?h=cec-conn. Do I
understand it correctly, that the above problem is addressed there by
unregistering an adapter in cec_notifier_conn_unregister (which will
result in /dev/cecX node going away)? I wonder to what degree this
solves the problem of HDMI and CEC drivers being loaded and unloaded
independently. It seems that in cases where HDMI driver is unloaded
and then loaded again, counterintuitively, the /dev/cecX might not
come back again, is this right, or am I missing something? Also, is it
guaranteed that adapter drivers won't try to access an adapter once it
gets removed by cec_notifier_conn_unregister?

Thank you.
