Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3F60D34CD2
	for <lists+linux-media@lfdr.de>; Tue,  4 Jun 2019 18:06:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728211AbfFDQGz (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 4 Jun 2019 12:06:55 -0400
Received: from mail-pg1-f194.google.com ([209.85.215.194]:38355 "EHLO
        mail-pg1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727422AbfFDQGy (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 4 Jun 2019 12:06:54 -0400
Received: by mail-pg1-f194.google.com with SMTP id v11so10620679pgl.5;
        Tue, 04 Jun 2019 09:06:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=nJIqSPSKaBTDsnLLvaJ6T2vPr21DEh1iTFuNuaCw98w=;
        b=Tal1B2T/RyUJVjfmT8/4Qr0txf7uGK8JYRKPhWvihPPvGLgdqbkPu05Lq41ynHJgmp
         yuqVej9QFaLJOS8f1ucxnEaTn28eRNdlBER8I6x/mTlOmYqDhXtk1wD06giyyOTSiGRN
         Rza5zfzfIUViRCVgL34NBVUSVyuMHs3QK7y+lzq6cRj4cUFFPk3dcZkJwjB77shLAQ/G
         6DNYs9YHJsqJggs+VpTsf2GwDfhF+ZbR7vWrmVSQDAFx0jwDR5BnmnQEGyUy2v3ix9O8
         PTovwXKuhe6C6y9/UP6f3oeImZjhwt71Ir+Q4oPaIfjULZxqpaZug6/OVofoRjlfX7FJ
         mIJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=nJIqSPSKaBTDsnLLvaJ6T2vPr21DEh1iTFuNuaCw98w=;
        b=LrZ+IW2AXNZIhYDfQRRoJNx6MEgYe6ufnSYZQVM/5EcqNS0ev5pdCrcebk2CjsrmBN
         Aw0s0D+uC8zM0/S1A+gFytlT0SyNfTC7SKA/QqwavJ+kOHP3PQaX9nOC1hWP8qgnU7nr
         P2dGecN+7sbUR6m1wIKeVySKlDPpPFepFkrOFHCLv7Rul/Nakwjd1KvexUo+WnJvu0dT
         sjISUPZ4TrkJAAZ/V6PKBrhfpo9wnpO+GG6wiPwKfXIHzmfXLUWRXrxeudlAWGHpkQGQ
         kxusK+pPByanpEr/D1QinNMcp662Gliis/InpxOYVeDKRXAjiuKRnwlH79B7j2rRL8pd
         FGcg==
X-Gm-Message-State: APjAAAWE12j2m4BhHbmxamzxWknVizw5MAGqX1t9SsIxzGBmZLfQOk6O
        tDWPuxjvysFtVJm5AtQ7Yxc=
X-Google-Smtp-Source: APXvYqw+sBhi6j0NjhLeNG7Yv63XMDDIqFDzU4sQrifk283DKywTWNwhRrWW1jSutCmlfSZPa8K1aA==
X-Received: by 2002:aa7:8219:: with SMTP id k25mr40656600pfi.38.1559664414015;
        Tue, 04 Jun 2019 09:06:54 -0700 (PDT)
Received: from dtor-ws ([2620:15c:202:201:3adc:b08c:7acc:b325])
        by smtp.gmail.com with ESMTPSA id b7sm16745013pgq.71.2019.06.04.09.06.52
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 04 Jun 2019 09:06:52 -0700 (PDT)
Date:   Tue, 4 Jun 2019 09:06:50 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc:     linux-media@vger.kernel.org,
        Boris Brezillon <boris.brezillon@collabora.com>,
        Florian Echtler <floe@butterbrot.org>,
        linux-input <linux-input@vger.kernel.org>
Subject: Re: [PATCH 5/7 RESEND] touchscreen/sur40: set device_caps in struct
 video_device
Message-ID: <20190604160650.GA226219@dtor-ws>
References: <20190604111958.22331-1-hverkuil-cisco@xs4all.nl>
 <1e12bc3d-3cb3-1f3d-b3bc-b25e3bf95523@xs4all.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1e12bc3d-3cb3-1f3d-b3bc-b25e3bf95523@xs4all.nl>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Hans,

On Tue, Jun 04, 2019 at 02:36:27PM +0200, Hans Verkuil wrote:
> Instead of filling in the struct v4l2_capability device_caps
> field, fill in the struct video_device device_caps field.
> 
> That way the V4L2 core knows what the capabilities of the
> video device are.
> 
> But this only really works if all drivers use this, so convert
> this touchscreen driver accordingly.
> 
> Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
> Cc: Florian Echtler <floe@butterbrot.org>
> ---
> Resend, adding Dmitry and linux-input to the CC list.
> 
> Dmitry, if you want to take this through your tree, then that's OK by me.
> 
> Alternatively, it can go through the media tree, but then I need your Ack.

I am fine with it going through media tree.

Acked-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>

Thanks.

-- 
Dmitry
