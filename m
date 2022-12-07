Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 21B7B646335
	for <lists+linux-media@lfdr.de>; Wed,  7 Dec 2022 22:24:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229753AbiLGVYX (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 7 Dec 2022 16:24:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54960 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229557AbiLGVYW (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 7 Dec 2022 16:24:22 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D5396B9C
        for <linux-media@vger.kernel.org>; Wed,  7 Dec 2022 13:23:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1670448200;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding;
        bh=W3Ak6m88jvMNLCc4j3ei4sI4S6/CwWYlMsJUuBuxeI4=;
        b=BuGJTGDS+iwaGKtVcuhTvxGinUt/SLAo7w2orVfJaN3dkgxDPNHT5k1kipUVW1BndF6cSt
        vqT8El/Bkh0EKaZ3gFqXA6TIiUyRBUdiUTUu9W9oGtbubA0qz/gHI5rM4wxOiZiyfHnyso
        shyhWbJEMT7i7MZ5SDWjOsmzfDDWbD0=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-459-dgcm-PKmMwKF2RPiCuX4gQ-1; Wed, 07 Dec 2022 16:23:18 -0500
X-MC-Unique: dgcm-PKmMwKF2RPiCuX4gQ-1
Received: by mail-ed1-f72.google.com with SMTP id x20-20020a05640226d400b0046cbe2b85caso6707533edd.3
        for <linux-media@vger.kernel.org>; Wed, 07 Dec 2022 13:23:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:subject:from:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=W3Ak6m88jvMNLCc4j3ei4sI4S6/CwWYlMsJUuBuxeI4=;
        b=wpGJIMsMzboOXXYxkv/fBAtHDIA4NE5xztGYdK7lkA2Xa0Ocbc08P9QBw2Yy4VGuLk
         rgOXxCNrEZpMcatQKxM9hDphkJM+mKFIn6JsXdwzqaCOM5raVBx8zc5iOQQmJ9H0mbqt
         i2+CGYafSXfHM/b9Combxt0q/C4YxHEbq6hykyIcgUlO/Qp/Zs8fC/2oR19oPFzHUSJe
         eBXoPK1VQehAulEvLwEB40hkouU6QE+Ul0dRQkCvV2Wn4NT2FCMYv/047MnnvlgQaVHo
         o4N0gSOuTEh6w57wumbTHX2vKoAvA9+rJgWZ/bkSGw95bPDUEwumKHFcvOlulIB3xYiM
         9oxQ==
X-Gm-Message-State: ANoB5pnDwjINRY9urs4AMi2xIM0DwyyHCSzJtOd2HlTL2McDuFH7/dHi
        Rd3LwTo3h1pqhDMZ33Mgq2c+Gc6I2Hgi4TiXg8i43y2fn6WAVPXKSqJ77W7TzlH3Y6R2m9J2efu
        sOyrGHgAsdhXiIfQbFRkpPOo=
X-Received: by 2002:a17:906:99cd:b0:7c1:10d9:8897 with SMTP id s13-20020a17090699cd00b007c110d98897mr6422280ejn.660.1670448197019;
        Wed, 07 Dec 2022 13:23:17 -0800 (PST)
X-Google-Smtp-Source: AA0mqf7XZe1F3HpbpCmlOpPorGUtppzLPofUp6RPPdKcwSYqVTVtpzdc0v3NV45M8HkbIBhAFNv1ug==
X-Received: by 2002:a17:906:99cd:b0:7c1:10d9:8897 with SMTP id s13-20020a17090699cd00b007c110d98897mr6422271ejn.660.1670448196843;
        Wed, 07 Dec 2022 13:23:16 -0800 (PST)
Received: from ?IPV6:2001:1c00:c1e:bf00:d69d:5353:dba5:ee81? (2001-1c00-0c1e-bf00-d69d-5353-dba5-ee81.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:d69d:5353:dba5:ee81])
        by smtp.gmail.com with ESMTPSA id z3-20020a170906240300b007aef930360asm9012386eja.59.2022.12.07.13.23.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 Dec 2022 13:23:16 -0800 (PST)
Message-ID: <545610e7-3446-2b82-60dc-7385fea3774f@redhat.com>
Date:   Wed, 7 Dec 2022 22:23:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Content-Language: en-US, nl
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Linux Media Mailing List <linux-media@vger.kernel.org>
From:   Hans de Goede <hdegoede@redhat.com>
Subject: "media: vb2: add (un)prepare_streaming queue ops" causes
 vb2_queue->streaming to be set earlier ?
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Hans,

I just fixed a crash in the out of tree driver which is caused by:

a10b21532574 ("media: vb2: add (un)prepare_streaming queue ops")

I know that breaking out of tree code is fine / not our problem,
but I wonder if this maybe affects some in tree code too ?

The problem with the out of tree driver is that it
used vb2_queue->streaming inside the buf_queue() callback
to determine if the buffer was being pre-queued (from
vb2_start_streaming() calling __enqueue_in_driver()) before
the start_streaming queue-op is called.

Or if it was being queued after the start_streaming queue-op
has been called.

With vb2_queue->streaming now being set before the
 __enqueue_in_driver() calls in vb2_start_streaming() this
broke and it went down the route to see if there was
space available in the hw-queue which NULL pointer deref-ed
because the hw-queue had not been setup yet (more or less).

This is fixed now as far as the ipu6 driver is concerned,
but I wonder if we may not have in tree drivers making
similar assumptions about vb2_queue->streaming in their
buf_queue() callbacks ?

Regards,

Hans




