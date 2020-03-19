Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 44C8018BB6F
	for <lists+linux-media@lfdr.de>; Thu, 19 Mar 2020 16:45:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727767AbgCSPpJ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 19 Mar 2020 11:45:09 -0400
Received: from us-smtp-delivery-74.mimecast.com ([216.205.24.74]:20436 "EHLO
        us-smtp-delivery-74.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727619AbgCSPpJ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 19 Mar 2020 11:45:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1584632707;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=uarX0K0WkQyekg6RxqpBFi4oNpTA2DnAzyM8/zQnD+s=;
        b=cJGITio++tJ2yjSR5VFoBdamYQhPxABhX+N20aUnDl3Fs2SbmoUe6pkeDop9MJyvLH1pd0
        9bBnalMhILHV3SMuHOE6jA+dFiu94RqnRW7qrCH7zxGW+QB4eDOFhAnkADFo3WQMqcjC6D
        LQaz8bHrdYhMhKINVAmLnV/PeXJ8ha4=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-101-vCEu9I5_OgG5KN_2pvXDug-1; Thu, 19 Mar 2020 11:45:05 -0400
X-MC-Unique: vCEu9I5_OgG5KN_2pvXDug-1
Received: by mail-qv1-f69.google.com with SMTP id ev8so3162519qvb.1
        for <linux-media@vger.kernel.org>; Thu, 19 Mar 2020 08:45:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=uarX0K0WkQyekg6RxqpBFi4oNpTA2DnAzyM8/zQnD+s=;
        b=dJZ1sxOPiCwZ2t3iMEv+j6tQs5xO5BkUH93CgtX8GAvMuTAAd0wQ4q7suZpgSMTnub
         hlXHRUu3TcdNXHeNBmAjuT2LYnjumTo/uv4SX1oY+cT2T2RReo739r/Ex0jKoq5RX1hy
         3sYEY9KRXMLS83T75qPklUdIbnUJyYrpQkPhVmQwh+9gvm/vHlBCITpoGjCorbUXFuw0
         iWItUOiHXG80Wlx+p+G+FA4O1081wbtd/LnCzPU7eKmPy65PXXSMp2Sz/U1tB3+zDNJb
         u4mpZpZyeDsBkA1s8c0ldnS9Pdc9DTvIaG9sVyuyKKY3wHaABisoy2KeiDfwPt3tLaOv
         cdXw==
X-Gm-Message-State: ANhLgQ0H1VO3bVZD4xvaWeUdNEskm6kziSPpKlpuulWMc6MM+3JgzNm9
        5x9QsEAREHQHUk+y34YBysDnifioJjV14TUnbNVi2NQJ63hzimgk+sIOO+pHaL4wCg3WNdDLVAW
        2BFFNTdN91uZ/IBelgLCj2K8=
X-Received: by 2002:a05:6214:286:: with SMTP id l6mr3683847qvv.200.1584632704942;
        Thu, 19 Mar 2020 08:45:04 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vuB21gw3DQ47Dzt+RdMDtOLxO2AyCZvMSK2YS3agFz+vf8F01Q1TUib7Xf1+lv5J8NGf4xmAA==
X-Received: by 2002:a05:6214:286:: with SMTP id l6mr3683742qvv.200.1584632703694;
        Thu, 19 Mar 2020 08:45:03 -0700 (PDT)
Received: from desoxy (c-24-61-245-152.hsd1.ma.comcast.net. [24.61.245.152])
        by smtp.gmail.com with ESMTPSA id f13sm1771431qti.47.2020.03.19.08.45.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Mar 2020 08:45:02 -0700 (PDT)
Message-ID: <edfc1443ad26af30bd954127ede24a0f2fc349fd.camel@redhat.com>
Subject: Re: [Mesa-dev] Plumbing explicit synchronization through the Linux
 ecosystem
From:   Adam Jackson <ajax@redhat.com>
To:     Jacob Lifshay <programmerjake@gmail.com>,
        Jason Ekstrand <jason@jlekstrand.net>
Cc:     Daniel Vetter <daniel.vetter@ffwll.ch>,
        xorg-devel <xorg-devel@lists.x.org>,
        Maling list - DRI developers 
        <dri-devel@lists.freedesktop.org>,
        "wayland-devel @ lists . freedesktop . org" 
        <wayland-devel@lists.freedesktop.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Discussion of the development of and with GStreamer 
        <gstreamer-devel@lists.freedesktop.org>,
        ML mesa-dev <mesa-dev@lists.freedesktop.org>,
        Nicolas Dufresne <nicolas@ndufresne.ca>,
        linux-media@vger.kernel.org
Date:   Thu, 19 Mar 2020 11:45:00 -0400
In-Reply-To: <CAC2bXD5qJgT9sWJgL_ej5OY42a-xzYaeLrwioKUreQuPJ1idpg@mail.gmail.com>
References: <CAOFGe94jy2VYDPbkMW8ZuNdAeM+HS8sM1OAYFGd9JKc1V7PVOQ@mail.gmail.com>
         <CAOFGe97LnmEHVoitgKdo+hbw9rYacofkzkt3pPcQSaw9BaKyaA@mail.gmail.com>
         <33d1749d876a83416c44671efcb37c74f87d1bd4.camel@ndufresne.ca>
         <20200316102034.GA30883@pendragon.ideasonboard.com>
         <CAOFGe95JUUBCuE=dWKtZVXjTLqxyf2oybpqAZ7hZhpBEKQ=Y-Q@mail.gmail.com>
         <20200316211502.GW4732@pendragon.ideasonboard.com>
         <74477a20fa78758dd6cf8c32d7a77d1cccf2646f.camel@ndufresne.ca>
         <CAOFGe963WUB+rkA=FURuXEk6BVjsP18yk4sJ3y_7VxKmscShrA@mail.gmail.com>
         <CAC2bXD5qJgT9sWJgL_ej5OY42a-xzYaeLrwioKUreQuPJ1idpg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.34.0 (3.34.0-1.fc31) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, 2020-03-17 at 10:12 -0700, Jacob Lifshay wrote:
> One related issue with explicit sync using sync_file is that combined
> CPUs/GPUs (the CPU cores *are* the GPU cores) that do all the
> rendering in userspace (like llvmpipe but for Vulkan and with extra
> instructions for GPU tasks) but need to synchronize with other
> drivers/processes is that there should be some way to create an
> explicit fence/semaphore from userspace and later signal it. This
> seems to conflict with the requirement for a sync_file to complete in
> finite time, since the user process could be stopped or killed.

DRI3 (okay, libxshmfence specifically) uses futexes for this. Would
that work for you? IIRC the semantics there are that if the process
dies the futex is treated as triggered, which seems like the only
sensible thing to do.

- ajax

