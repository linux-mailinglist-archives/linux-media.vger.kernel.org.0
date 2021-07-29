Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 09D413DA72D
	for <lists+linux-media@lfdr.de>; Thu, 29 Jul 2021 17:08:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237648AbhG2PIv (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 29 Jul 2021 11:08:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42992 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237056AbhG2PIv (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 29 Jul 2021 11:08:51 -0400
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 46B87C061765
        for <linux-media@vger.kernel.org>; Thu, 29 Jul 2021 08:08:48 -0700 (PDT)
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: ezequiel)
        with ESMTPSA id 696961F4431F
Message-ID: <1f097baa31efc22009eb5a38119ec6df8cac912e.camel@collabora.com>
Subject: Re: [PATCH 3/3] videobuf2-core: sanity checks for requests and qbuf
From:   Ezequiel Garcia <ezequiel@collabora.com>
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        linux-media@vger.kernel.org
Cc:     Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        Daniel Almeida <daniel.almeida@collabora.com>,
        Nicolas Dufresne <nicolas.dufresne@collabora.com>
Date:   Thu, 29 Jul 2021 12:08:37 -0300
In-Reply-To: <20210729133627.1592672-4-hverkuil-cisco@xs4all.nl>
References: <20210729133627.1592672-1-hverkuil-cisco@xs4all.nl>
         <20210729133627.1592672-4-hverkuil-cisco@xs4all.nl>
Organization: Collabora
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.38.3-1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, 2021-07-29 at 15:36 +0200, Hans Verkuil wrote:
> The combination of supports_requests == 1 and min_buffers_needed > 0
> is not allowed, WARN on that and return an error.
> 
> Also check that if vb2_core_qbuf() is called from req_queue, that it
> doesn't return an error, unless it is -EIO.
> 
> Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
> Cc: Ezequiel Garcia <ezequiel@collabora.com>
> Cc: Paul Kocialkowski <paul.kocialkowski@bootlin.com>

Reviewed-by: Ezequiel Garcia <ezequiel@collabora.com>

Thanks,
Ezequiel

