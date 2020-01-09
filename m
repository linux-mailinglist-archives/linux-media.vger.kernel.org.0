Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DEF811359C8
	for <lists+linux-media@lfdr.de>; Thu,  9 Jan 2020 14:12:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730222AbgAINM0 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 9 Jan 2020 08:12:26 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:25931 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1728974AbgAINM0 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 9 Jan 2020 08:12:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1578575545;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=srUYTPIJqQbqKSOeuzG6sUoYCLfqR+OlfvWGhjcIli4=;
        b=RksH8kQRNiVTMxIK3y9xfsPcKMG2ArPvkx5sPwwAd8HcfNXt3pqpPn2JQNTlaDQbD6N3UM
        dP4170FLlqcdtoZQoo8EjkBXaQDAurjeKS6CMJlkrO0669b0NHh4O5kyY7FFRzJlDAcNUP
        5su2P0IjncaMyldEIJkjlfrg45XLuZY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-345-FSOqwKyAMW2ReqGCfPwcZA-1; Thu, 09 Jan 2020 08:12:21 -0500
X-MC-Unique: FSOqwKyAMW2ReqGCfPwcZA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 91C7D800D53;
        Thu,  9 Jan 2020 13:12:19 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-98.ams2.redhat.com [10.36.116.98])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 3D50084665;
        Thu,  9 Jan 2020 13:12:19 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
        id 6F3A831F2D; Thu,  9 Jan 2020 14:12:18 +0100 (CET)
Date:   Thu, 9 Jan 2020 14:12:18 +0100
From:   Gerd Hoffmann <kraxel@redhat.com>
To:     David Stevens <stevensd@google.com>
Cc:     David Stevens <stevensd@chromium.org>,
        virtio-dev@lists.oasis-open.org, Dylan Reid <dgreid@chromium.org>,
        Tomasz Figa <tfiga@chromium.org>,
        Zach Reizner <zachr@chromium.org>,
        Keiichi Watanabe <keiichiw@chromium.org>,
        Alexandre Courbot <acourbot@chromium.org>,
        Alex Lau <alexlau@chromium.org>,
        =?utf-8?B?U3TDqXBoYW5l?= Marchesin <marcheu@chromium.org>,
        Pawel Osciak <posciak@chromium.org>,
        Gurchetan Singh <gurchetansingh@chromium.org>,
        Stefan Hajnoczi <stefanha@gmail.com>,
        qemu-devel <qemu-devel@nongnu.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>
Subject: Re: [virtio-dev][RFC PATCH v1 1/2] content: define what exporting a
 resource is
Message-ID: <20200109131218.5xc6zhovbgjavfpv@sirius.home.kraxel.org>
References: <CAD=HUj6FA3VoTJqNa+gmAgVOv9zS7Qk9pdg46EY9NvtJOdz5_A@mail.gmail.com>
 <20200108104002.jxh6amnrazhnamej@sirius.home.kraxel.org>
 <CAOiLmNHMAz6UqxuEsiq6Y_dSNcCvtBrFR-FHG6voJAhpF8SeeA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAOiLmNHMAz6UqxuEsiq6Y_dSNcCvtBrFR-FHG6voJAhpF8SeeA@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

  Hi,

> that isn't just a leaf node of the spec. I think it's better to define
> 'resource' as a top level concept for virtio devices, even if the specifics
> of what a 'resource' is are defined by individual device types.

Your patch doesn't define what a resource is though.  It only refers to
something it calls 'resource' ...

cheers,
  Gerd

