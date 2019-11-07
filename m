Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3665EF2BA3
	for <lists+linux-media@lfdr.de>; Thu,  7 Nov 2019 10:57:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387775AbfKGJ5G (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 7 Nov 2019 04:57:06 -0500
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:49700 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1727408AbfKGJ5G (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 7 Nov 2019 04:57:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1573120625;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=kwK3dtS10PmIBywGuO8Nn3JLz9YAnC7Sxmn2cjhu5xk=;
        b=H15o5JlHNkkZjCM3FIHrzfrjxKJzBDM/JYh/bU5s4iEbZKbgBzZOfSGKJZ5le+FkJxFhgY
        +Vyl4h7hgWZ4aDVEKqE7LO3H6341DU1IXXhi89tH9oMzxWxCkgCn2ygeJvEL6zLLNmb8Ii
        zJ0MO6IzKK31MUqyn9u0Z12q9VPavfY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-65-AbXpPooINvOV_gfI7s_T-A-1; Thu, 07 Nov 2019 04:57:01 -0500
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BC450477;
        Thu,  7 Nov 2019 09:56:59 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-69.ams2.redhat.com [10.36.116.69])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 38DD9271A3;
        Thu,  7 Nov 2019 09:56:59 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
        id 22B7217535; Thu,  7 Nov 2019 10:56:57 +0100 (CET)
Date:   Thu, 7 Nov 2019 10:56:57 +0100
From:   Gerd Hoffmann <kraxel@redhat.com>
To:     Dmitry Sepp <dmitry.sepp@opensynergy.com>
Cc:     virtio-dev@lists.oasis-open.org, linux-media@vger.kernel.org,
        tfiga@chromium.org, keiichiw@chromium.org, acourbot@chromium.org,
        alexlau@chromium.org, dgreid@chromium.org, marcheu@chromium.org,
        posciak@chromium.org, stevensd@chromium.org, hverkuil@xs4all.nl,
        daniel@ffwll.ch
Subject: Re: [virtio-dev] [RFC RESEND] virtio-video: Add virtio video device
 specification
Message-ID: <20191107095657.72dlxzm4uz7ndkek@sirius.home.kraxel.org>
References: <20191105191919.167345-1-dmitry.sepp@opensynergy.com>
MIME-Version: 1.0
In-Reply-To: <20191105191919.167345-1-dmitry.sepp@opensynergy.com>
User-Agent: NeoMutt/20180716
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-MC-Unique: AbXpPooINvOV_gfI7s_T-A-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, Nov 05, 2019 at 08:19:19PM +0100, Dmitry Sepp wrote:
> [Resend after fixing an issue with the virtio-dev mailing list]
>=20
> This patch proposes a virtio specification for a new virtio video
> device.

Hmm, quickly looking over this, it looks simliar to the vdec draft
posted a few weeks ago, with other device variants added but not
fully specified yet.

So, can you clarify the relationship between the two?

thanks,
  Gerd

