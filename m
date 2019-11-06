Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1D7F0F1655
	for <lists+linux-media@lfdr.de>; Wed,  6 Nov 2019 13:50:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730720AbfKFMub (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 6 Nov 2019 07:50:31 -0500
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:29755 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1727652AbfKFMub (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 6 Nov 2019 07:50:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1573044630;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=S5mjYIqJLMJa3ZJWg5UFuDSjEWysvBSt/c6ng9WIu74=;
        b=GNaC9IxbQO5IkL84GQEKpqjDkqoNj8YkhBlHU8kTLD+tZdtjFIRL/ehj2oRm1VLCUrrjz2
        TBnJmAQdMxyUW3dbnHM7zYDZrv4xbIB1123Ah8uN4QpfATM9f52bYebOlr/WII7QbHs5Sd
        bsphT+4wqfyEfBG2M+ut9v2ed22q2+k=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-211-VbVJH6PKPki9D82kYwOOcQ-1; Wed, 06 Nov 2019 07:50:26 -0500
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DC6C8107ACC3;
        Wed,  6 Nov 2019 12:50:24 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-69.ams2.redhat.com [10.36.116.69])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 8F32E1001B34;
        Wed,  6 Nov 2019 12:50:24 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
        id BF0DD9D23; Wed,  6 Nov 2019 13:50:23 +0100 (CET)
Date:   Wed, 6 Nov 2019 13:50:23 +0100
From:   Gerd Hoffmann <kraxel@redhat.com>
To:     Stefan Hajnoczi <stefanha@gmail.com>
Cc:     geoff@hostfission.com, virtio-dev@lists.oasis-open.org,
        Alex Lau <alexlau@chromium.org>,
        Daniel Vetter <daniel@ffwll.ch>,
        Alexandre Courbot <acourbot@chromium.org>,
        qemu-devel <qemu-devel@nongnu.org>,
        Tomasz Figa <tfiga@chromium.org>,
        Keiichi Watanabe <keiichiw@chromium.org>,
        David Stevens <stevensd@chromium.org>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        =?utf-8?B?U3TDqXBoYW5l?= Marchesin <marcheu@chromium.org>,
        Dylan Reid <dgreid@chromium.org>,
        Gurchetan Singh <gurchetansingh@chromium.org>,
        Dmitry Morozov <dmitry.morozov@opensynergy.com>,
        Pawel Osciak <posciak@chromium.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>
Subject: Re: guest / host buffer sharing ...
Message-ID: <20191106125023.uhdhtqisybilxasr@sirius.home.kraxel.org>
References: <20191105105456.7xbhtistnbp272lj@sirius.home.kraxel.org>
 <20191106084344.GB189998@stefanha-x1.localdomain>
 <20191106095122.jju7eo57scfoat6a@sirius.home.kraxel.org>
 <CAJSP0QUJBkqtVJq17tfX5O-JuvEGcZQviP0C3tv9qSDy-P-hcg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAJSP0QUJBkqtVJq17tfX5O-JuvEGcZQviP0C3tv9qSDy-P-hcg@mail.gmail.com>
User-Agent: NeoMutt/20180716
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-MC-Unique: VbVJH6PKPki9D82kYwOOcQ-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

  Hi,

> In the graphics buffer sharing use case, how does the other side
> determine how to interpret this data?

The idea is to have free form properties (name=3Dvalue, with value being
a string) for that kind of metadata.

> Shouldn't there be a VIRTIO
> device spec for the messaging so compatible implementations can be
> written by others?

Adding a list of common properties to the spec certainly makes sense,
so everybody uses the same names.  Adding struct-ed properties for
common use cases might be useful too.

cheers,
  Gerd

