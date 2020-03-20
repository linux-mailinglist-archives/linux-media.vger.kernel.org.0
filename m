Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D151E18C79A
	for <lists+linux-media@lfdr.de>; Fri, 20 Mar 2020 07:41:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726631AbgCTGlx (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 20 Mar 2020 02:41:53 -0400
Received: from us-smtp-delivery-74.mimecast.com ([63.128.21.74]:58130 "EHLO
        us-smtp-delivery-74.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726602AbgCTGlx (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 20 Mar 2020 02:41:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1584686511;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=zIiMql8rUOL5/l47A6mLqkL+iilKl56+acJaSeSetcI=;
        b=MX/I842Oqkv20LNI5/Ffb1l77PJjXIc0CsMBDEV26GgTG1RKYYxn78yset2YjhhdghBAPB
        jUu74Z435y/zUWK3+7f8ivn9GAjns779uNl/psEze1rfUhuxbq6mPPksq0ju5xdBTYYgur
        dJCcMpbd7ZbRqzkfFtTLsXFFldLYqcE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-394-WiowU-PiM_6ez1OPaTiO_w-1; Fri, 20 Mar 2020 02:41:47 -0400
X-MC-Unique: WiowU-PiM_6ez1OPaTiO_w-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E97D418B60B8;
        Fri, 20 Mar 2020 06:41:44 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-49.ams2.redhat.com [10.36.112.49])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 6CEF094945;
        Fri, 20 Mar 2020 06:41:44 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
        id 9930C9DB3; Fri, 20 Mar 2020 07:41:43 +0100 (CET)
Date:   Fri, 20 Mar 2020 07:41:43 +0100
From:   Gerd Hoffmann <kraxel@redhat.com>
To:     David Stevens <stevensd@chromium.org>
Cc:     virtio-comment@lists.oasis-open.org,
        Dylan Reid <dgreid@chromium.org>,
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
Subject: Re: [PATCH v4 0/2] Cross-device resource sharing
Message-ID: <20200320064143.4b2kyskr5clxsczs@sirius.home.kraxel.org>
References: <20200319021823.57219-1-stevensd@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200319021823.57219-1-stevensd@chromium.org>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, Mar 19, 2020 at 11:18:21AM +0900, David Stevens wrote:
> Hi all,
> 
> This is the next iteration of patches for adding support for sharing
> resources between different virtio devices. The corresponding Linux
> implementation is [1].
> 
> In addition to these patches, the most recent virtio-video patchset
> includes a patch for importing objects into that device [2].

Looks good to me.

So, open a github issue to kick the TC vote process and get this merged?
(see virtio-spec/.github/PULL_REQUEST_TEMPLATE.md).

cheers,
  Gerd

