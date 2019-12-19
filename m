Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5A0831262AD
	for <lists+linux-media@lfdr.de>; Thu, 19 Dec 2019 13:54:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726866AbfLSMyt (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 19 Dec 2019 07:54:49 -0500
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:48861 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726708AbfLSMyo (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 19 Dec 2019 07:54:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1576760083;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=xG429UBbvdGY4I/mszsOkYbckUSEMVlOc//9hOgRBX0=;
        b=SDkp21Pu2AQ8ZboccwqwaPJ+98nAqQWkQYaAbS2xn/ieUW1zn+peDZ+WZvFIWox1SpIxpm
        qF/J1d2VDBho84MbiWZOkDIixsRBf7MBFz8ja1Fgw0Te8507fWQp8s6IRnyUDLVMEBRvhL
        6GyVRDPJLX3uvdYcisIwwoo9GjBC2Os=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-248-wKnXy5mbNaOCgL7vVqaroA-1; Thu, 19 Dec 2019 07:54:40 -0500
X-MC-Unique: wKnXy5mbNaOCgL7vVqaroA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CE4BF1856A69;
        Thu, 19 Dec 2019 12:54:37 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-98.ams2.redhat.com [10.36.116.98])
        by smtp.corp.redhat.com (Postfix) with ESMTP id A21386BF90;
        Thu, 19 Dec 2019 12:54:34 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
        id 0561311AAA; Thu, 19 Dec 2019 13:54:32 +0100 (CET)
Date:   Thu, 19 Dec 2019 13:54:32 +0100
From:   Gerd Hoffmann <kraxel@redhat.com>
To:     Dmitry Sepp <dmitry.sepp@opensynergy.com>
Cc:     Keiichi Watanabe <keiichiw@chromium.org>,
        virtio-dev@lists.oasis-open.org, linux-media@vger.kernel.org,
        acourbot@chromium.org, alexlau@chromium.org, daniel@ffwll.ch,
        dgreid@chromium.org, egranata@google.com, fziglio@redhat.com,
        hverkuil@xs4all.nl, marcheu@chromium.org, posciak@chromium.org,
        spice-devel@lists.freedesktop.org, stevensd@chromium.org,
        tfiga@chromium.org, uril@redhat.com
Subject: Re: [PATCH v2 1/1] virtio-video: Add virtio video device
 specification
Message-ID: <20191219125432.ogb2gdvmly6iuqti@sirius.home.kraxel.org>
References: <20191218130214.170703-1-keiichiw@chromium.org>
 <20191218130214.170703-2-keiichiw@chromium.org>
 <20191218134037.3jbouht52bxqwfyy@sirius.home.kraxel.org>
 <2570078.xtWa8k4VtA@os-lin-dmo>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2570078.xtWa8k4VtA@os-lin-dmo>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

  Hi,

> > I also can't see why the flag is needed in the first place.  The driver
> > should know which buffers are queued still and be able to figure
> > whenever the drain is complete or not without depending on that flag.
> > So I'd suggest to simply drop it.
> This flag is used not for drain only. In marks the completion of whatever 
> specific buffer sequence, like a full end-of-stream, resolution change, drain 
> etc. We also need this to handle nested sequences. For instance, a resolution 
> change event might happen while in drain.

Ah, ok.  That makes sense (please clarify this in the spec).

cheers,
  Gerd

