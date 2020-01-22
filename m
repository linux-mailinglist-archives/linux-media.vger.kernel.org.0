Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E6D8B145377
	for <lists+linux-media@lfdr.de>; Wed, 22 Jan 2020 12:10:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726049AbgAVLKi (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 22 Jan 2020 06:10:38 -0500
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:54608 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725911AbgAVLKi (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 22 Jan 2020 06:10:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1579691436;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=eO4GVMtUbM431bCEg+lkuqmor778MjyCZA808QLMqS4=;
        b=QxyQ1YUd50PnbY/ASQhW0mB+Hpr54t8JdE69HK0cvhjoZrSo39Q+iDFKr1VVh3xn1kavz7
        Pnrtt5ET4oqDQnAHyUfYIFLRFmbKQA3SFUiDzrqBr00Lkuwdp57IfQmrreEVg3WnFQ6yxX
        hZlZzNaoy21ujOsc+W97+Vh1LnHM6Ns=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-117--g1y6Qc2NyGnhhXq5xWO_Q-1; Wed, 22 Jan 2020 06:10:33 -0500
X-MC-Unique: -g1y6Qc2NyGnhhXq5xWO_Q-1
Received: by mail-wr1-f70.google.com with SMTP id j4so2859513wrs.13
        for <linux-media@vger.kernel.org>; Wed, 22 Jan 2020 03:10:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=eO4GVMtUbM431bCEg+lkuqmor778MjyCZA808QLMqS4=;
        b=agzYwbjrchxTEgtLQfmXoMaaLP4QpZoyXoNjKkzX2cOov4uPFOGw5j8qqsPpeP+P34
         cEW0Vs1X0NyYN+rXMsNJURWgNRYwwK5mgNjncJP9vmMdo1WsnDigd/lNLveb3kTmTIDC
         J98nF9B9wQ7/YdEvTTrjjuQzMtrxnvnld4oMTa/IBUAoUDUUDJyiXdaf/ClSuHTiHtxB
         EdL0hjdDCdvg7s0u67/yf8GOujnNzGemDXfhYdsR5PkeZWDYpFIhEtjbEG/y5hFg5/rh
         zlqNeIGhjrkuNc9EcqhZSuwto/T1F1vBZG2EMV2ANHqBuycOJvgE46+AKydXyA/6Uz6Z
         2fww==
X-Gm-Message-State: APjAAAX+pea1YtFUXHyU8EI+g9f0YRqDoT5I5tQIysfkMuNNOJeoxLk0
        4I6w2LdUvmuyy4O4mS1GhS/LNR6w4E91qr5A94W2JBRvibUacRVtFIggIje4lQq78mXAYGxaV6G
        isM8AHIgXJcR41E4Uhg8L4P4=
X-Received: by 2002:a5d:62c8:: with SMTP id o8mr10441935wrv.316.1579691432575;
        Wed, 22 Jan 2020 03:10:32 -0800 (PST)
X-Google-Smtp-Source: APXvYqw8oL2cX5iW5xD84daiqBJZSBzLc4PmEMw71lBAcTJXkhMX+dk+nsIzrC+pF4km4UpxwIKoAQ==
X-Received: by 2002:a5d:62c8:: with SMTP id o8mr10441902wrv.316.1579691432316;
        Wed, 22 Jan 2020 03:10:32 -0800 (PST)
Received: from redhat.com (bzq-79-176-0-156.red.bezeqint.net. [79.176.0.156])
        by smtp.gmail.com with ESMTPSA id c5sm3739958wmb.9.2020.01.22.03.10.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jan 2020 03:10:31 -0800 (PST)
Date:   Wed, 22 Jan 2020 06:10:27 -0500
From:   "Michael S. Tsirkin" <mst@redhat.com>
To:     David Stevens <stevensd@chromium.org>
Cc:     Gerd Hoffmann <kraxel@redhat.com>,
        Dylan Reid <dgreid@chromium.org>,
        Tomasz Figa <tfiga@chromium.org>,
        Zach Reizner <zachr@chromium.org>,
        Keiichi Watanabe <keiichiw@chromium.org>,
        Alexandre Courbot <acourbot@chromium.org>,
        Alex Lau <alexlau@chromium.org>,
        =?iso-8859-1?Q?St=E9phane?= Marchesin <marcheu@chromium.org>,
        Pawel Osciak <posciak@chromium.org>,
        Gurchetan Singh <gurchetansingh@chromium.org>,
        Stefan Hajnoczi <stefanha@gmail.com>,
        qemu-devel <qemu-devel@nongnu.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        virtio-dev@lists.oasis-open.org
Subject: Re: [virtio-dev][RFC PATCH v1 1/2] content: define what an exported
 object is
Message-ID: <20200122060844-mutt-send-email-mst@kernel.org>
References: <CAD=HUj640QfNwO4J_tdcSx36YOVAVT_dZUXYuKPaCKvZVWeHsg@mail.gmail.com>
 <20200122032103-mutt-send-email-mst@kernel.org>
 <CAD=HUj4pORJK1SQ2+n_oiXJyGaKqakSiOGcXdRCGSAMnuxY4cw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAD=HUj4pORJK1SQ2+n_oiXJyGaKqakSiOGcXdRCGSAMnuxY4cw@mail.gmail.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Jan 22, 2020 at 07:13:41PM +0900, David Stevens wrote:
> > > +When an object created by one virtio device needs to be
> > > +shared with a seperate virtio device, the first device can
> > > +export the object by generating a \field{uuid}
> >
> > This is a field where?
> 
> It's a property of the exported object, but I guess it doesn't really
> correspond to any concrete field. I'll remove \field.
> 
> > > which the
> > > +guest can pass to the second device to identify the object.
> >
> > s/guest/Driver/ ?
> 
> The uuid can be passed to a second device controlled by a different
> driver, so I think 'driver' by itself is ambiguous. I'm using guest as
> a shorthand for 'system which includes the drivers and software which
> sits on top of the drivers', and that meaning does seem to be
> compatible with language in the rest of the spec. If that shorthand
> isn't acceptable, I can rewrite the sentence passively as '... a uuid
> which can then be passed to a second device ...'.
> 
> > Also - what are guest and host here?
> 
> There are a number of places in the virtio spec where 'guest' is used
> to refer to the system where drivers run and where 'host' is used to
> refer to the system where devices run. I guess those terms aren't
> concretely defined within the spec, but they do seem to have a well
> understood meaning. Or is the guest/host language discouraged in new
> additions to the spec?
> 
> -David

Yes - generally most devices are/should be implementable in hardware.
In that setup guest/host doesn't make sense.
We haven't reworked all of spec with that in mind yet,
and in some cases such as the balloon it's actually specific to
virtualization.

-- 
MST

