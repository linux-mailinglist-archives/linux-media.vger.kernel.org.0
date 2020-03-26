Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C772E194684
	for <lists+linux-media@lfdr.de>; Thu, 26 Mar 2020 19:30:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728463AbgCZSaH (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 26 Mar 2020 14:30:07 -0400
Received: from mail-qv1-f68.google.com ([209.85.219.68]:36401 "EHLO
        mail-qv1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727192AbgCZSaG (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 26 Mar 2020 14:30:06 -0400
Received: by mail-qv1-f68.google.com with SMTP id z13so3572733qvw.3
        for <linux-media@vger.kernel.org>; Thu, 26 Mar 2020 11:30:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20150623.gappssmtp.com; s=20150623;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=L9DrCA/EQHd8jdwveo8WB0n14bq7yGLSzZRVaNtKOrs=;
        b=iB7rqAN6jeIbSZfKYuy8sMd7TSkM3YjZagIPsTb7Y89qtMEwT3aZ6XjqnYy+hmH/Z+
         oyhSxv4YgXavcDrKegi5kkVIaU7Z24Zd8FMe7pKWSl58bgrA3gRNNpWd0TFV/Vorwsex
         ei2qmtjpLBVAJ2UqNogppLnOkIkrnEaU8HDYG3dscfdBS3upd3h3KfsfeRrvNtVFwj2f
         IOnim0aOPoBnGNl55M+CK9ShbujuVgjx9wDDZEmsl7D3A/uCrTqh51lYO+8bh+THXJ1R
         4i98KCClqxK0YVegzHEvzR4Ukp5FPPMyRvh58TlJanklRmsBB784Kw4Z6lv7wSX3D04k
         T3Ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=L9DrCA/EQHd8jdwveo8WB0n14bq7yGLSzZRVaNtKOrs=;
        b=TBq7pkHVNBRn5FrXj9UaKkHV0qcpnB4wxcmOpLoOWk99s/b+JOsqfzU1g5WxkVAYYp
         wG4m94lja9/MXpQbsX8/riAEVga1pr9tMrbe95AlXZhhtwwCsCmB87nmdEBZLLFbcgHJ
         mw5QUufDWZVxp//+8jKn5VmcU10dtczppVe0Xre+nQBbvuC3aiqmimT81wHUb/1qWoh2
         i5O2wuQECkSpUT0jY06WjkHvYu1ao2BtfhFo2Np0DBrJb3pZ463VsboIZKxtE3nqzKCC
         B+vSfsUtYKTFy3fkSL2RPVtOKFqQ+nHH9TfhmgyA1ouDCh1X+Ixz7vydZprYWGGC+6Z0
         X7fw==
X-Gm-Message-State: ANhLgQ0x4+q0UosnazoaxPR7rItM8nbsrDbw0BHLgmldqnv27E7cVYee
        wvzBt/r9znZHmL5qp3/1+bdP6g==
X-Google-Smtp-Source: ADFU+vt6K8GAQVwSKHIYexBPxdvx1dHoDAis8RLP4ledoNV32sheix2hQWb8suQQAoBCFpRvETYj5Q==
X-Received: by 2002:ad4:4bc3:: with SMTP id l3mr9280133qvw.79.1585247404992;
        Thu, 26 Mar 2020 11:30:04 -0700 (PDT)
Received: from nicolas-tpx395.localdomain (marriott-chateau-champlain-montreal.sites.intello.com. [66.171.169.34])
        by smtp.gmail.com with ESMTPSA id l7sm1917676qkb.47.2020.03.26.11.30.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Mar 2020 11:30:03 -0700 (PDT)
Message-ID: <3fb1dcdbbf54051d9a8fee1d1498583c3a79cecd.camel@ndufresne.ca>
Subject: Re: [PATCH v2 3/8] hantro: Use v4l2_m2m_buf_done_and_job_finish
From:   Nicolas Dufresne <nicolas@ndufresne.ca>
To:     Ezequiel Garcia <ezequiel@collabora.com>,
        Hans Verkuil <hverkuil@xs4all.nl>, linux-media@vger.kernel.org,
        linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Cc:     Tomasz Figa <tfiga@chromium.org>, kernel@collabora.com,
        Jonas Karlman <jonas@kwiboo.se>,
        Heiko Stuebner <heiko@sntech.de>,
        Alexandre Courbot <acourbot@chromium.org>,
        Jeffrey Kardatzke <jkardatzke@chromium.org>,
        Rob Herring <robh@kernel.org>
Date:   Thu, 26 Mar 2020 14:30:01 -0400
In-Reply-To: <648c8411353071a7e1ffd3576d268b01177ab678.camel@collabora.com>
References: <20200318132108.21873-1-ezequiel@collabora.com>
                 <20200318132108.21873-4-ezequiel@collabora.com>
                 <13b1efe1-8b52-070b-cf11-b230bd405d3e@xs4all.nl>
                 <0a8f6d97e6869ff694aedd67a3176217a885c938.camel@ndufresne.ca>
                 <50d764ec-1c15-99bd-192b-9aa6ae5bf368@xs4all.nl>
         <648c8411353071a7e1ffd3576d268b01177ab678.camel@collabora.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.34.4 (3.34.4-1.fc31) 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Le mercredi 25 mars 2020 à 17:30 -0300, Ezequiel Garcia a écrit :
>    1. On Wed, 2020-03-25 at 16:28 +0100, Hans Verkuil wrote:
> > On 3/25/20 3:02 PM, Nicolas Dufresne wrote:
> > > Le mercredi 25 mars 2020 à 09:22 +0100, Hans Verkuil a écrit :
> > > > On 3/18/20 2:21 PM, Ezequiel Garcia wrote:
> > > > > Let the core sort out the nuances of returning buffers
> > > > > to userspace, by using the v4l2_m2m_buf_done_and_job_finish
> > > > > helper.
> > > > > 
> > > > > This change also removes usage of buffer sequence fields,
> > > > > which shouldn't have any meaning for stateless decoders.
> > > > 
> > > > Uh, why remove this? For one, doesn't this cause fails in v4l2-compliance?
> > > > Also, while I agree that it is not terribly useful, it doesn't hurt, does it?
> > > > 
> > > > And the V4L2 spec makes no exception for stateless codecs with respect to the
> > > > sequence field.
> > > > 
> > > > Nacked-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
> > > 
> > > The spec also does not say what it means either. As an example, you
> > > have spec for ALTERNATE interlacing mode that changes the meaning of
> > > the sequence, but not for alternate H264 fields (which cannot be part
> > > of the format, since this changes often). We also don't have spec for
> > > the the sequence behaviour while using HOLD features.
> > 
> > I hate it that the spec changes the sequence meaning for FIELD_ALTERNATE,
> > I always thought that that made drivers unnecessarily complicated. Unfortunately,
> > this is something we inherited.
> > 
> > Currently the spec says for sequence:
> > 
> > "Set by the driver, counting the frames (not fields!) in sequence. This field is set
> >  for both input and output devices."
> > 
> > The only thing missing here is that it should say that for compressed formats this
> > counts the buffers, since one buffer with compressed data may not have a one-to-one
> > mapping with frames.

That's also why I think it's programatically useless in that case, there is no
logic for which input/output can be related unless you know what the framing is.

> > 
> > This description for 'sequence' was never updated when compressed data formats were
> > added, so it is a bit out of date.
> > 
> > > I'm worried we are falling into the test driven trap, were people
> > > implement features to satisfy a test, while the added complexity don't
> > > really make sense. Shouldn't we change our approach and opt-out
> > > features for new type of HW, so that we can keep the drivers code
> > > saner?
> > 
> > Why wasn't the existing code in this patch sane? Sure, we can change the spec, but
> > then 1) all existing drivers need to be updated as well, and 2) v4l2-compliance needs
> > to be changed to test specifically for this class of drivers and ensure that for those
> > the sequence field is set to 0. Not to mention introducing an exception in the uAPI
> > where the sequence field suddenly isn't used anymore.
> > 
> > Frankly, I would prefer that the whole sequence handling is moved to videobuf2-v4l2.c.
> > It really doesn't belong in drivers, with the exception of incrementing the sequence
> > counter in case of dropped frames.
> > 
> > I think I suggested it when vb2 was being designed, but at the time the preference
> > was to keep it in the driver. Long time ago, though.
> > 
> 
> Do you think we could try to move this to the core?

I'm also happy as long as drivers stop having to implement this generic
statistic. Note, that only applies to existing m2m, we still need that counter
to detect driver side frame drops in CAPTURE only devices (like UVC cameras).

> 
> I might be able find some time to try that.
> 
> > And another reason why I want to keep it: I find it actually useful to see a running
> > counter: it helps keeping track of how many buffers you've processed since you started
> > streaming.
> > 
> 
> +1
> 
> > Finally, the removal of the sequence counter simply does not belong in this patch.
> > 
> 
> Agreed, no complaints on my side.
> 
> I am actually happy about this feedback.
> 
> Thanks,
> Ezequiel
> 
> 

