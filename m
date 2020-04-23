Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4D5331B6227
	for <lists+linux-media@lfdr.de>; Thu, 23 Apr 2020 19:41:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729983AbgDWRlC (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 23 Apr 2020 13:41:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45566 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729917AbgDWRlC (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 23 Apr 2020 13:41:02 -0400
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com [IPv6:2a00:1450:4864:20::342])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AD24FC09B042;
        Thu, 23 Apr 2020 10:41:01 -0700 (PDT)
Received: by mail-wm1-x342.google.com with SMTP id 188so7323027wmc.2;
        Thu, 23 Apr 2020 10:41:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=gWv80nzXUhTdWCFgmyjTCUoBOWCYJ0shhaZECz9MPDU=;
        b=NX1C5IscIq8eq/7t7aqC4WMjLMIwy0TYJXkv81hlXtOf7GAgezW8xB3N+PSUNC4nDL
         5PNxuRDBeCtnM/2Xb8IYAkefyXNM9TED4TjytiGbv2wdOMKxNlEL44KXM+rAEBq3tFCw
         EpVcUvYprGVexQv7brmcia+kisIR3akARAx1SFcKsIoVNBjfnULTFrBocFex8JGj7lYJ
         Ra0b7OB5ZIxBvXVs8Od3sSB/I7tD9MrS3y/U8KFGGFS7YJd+4FOD6+FmeQoj5HkeDuBV
         Pv7ag4Mj2hz8C/+5aBe3w+KsQliYhuYkPfZMRWiwT/4HsjaK3JK7ICWbGCOsmNnt9fxR
         ZdDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=gWv80nzXUhTdWCFgmyjTCUoBOWCYJ0shhaZECz9MPDU=;
        b=efwwXqeq8lQwehA6DstKYQuPR28mvLmZaLkB4OmowXxbZ5aBD1jEflZ+EKaJLG+fx4
         q1CAlI3C7GsDR3CNf5gOW5jzMI2nCwtyLRBJCRKdwKpqoPySlKnBMhPYWAP2ome9vSZZ
         /dMJafxUL70ly9/Q5OC9/HdZF60iLNIEwLijP3MrGgRu+Dcb3M1RmEewbPt+8feSTbrb
         1Wr5quVKe56NVlI4CsCUbCSFEYV2pdNG7q6x2jHGDMZ80kaQFxp07rfA3ZaDA8WSF5E5
         VHrfUnE2dL8XWEDavGbhTJDpJFGK/YqmW2kWWHfqWhGN2N7htAxwAukBw7WhfrYysLM4
         GvyQ==
X-Gm-Message-State: AGi0PuZkcodaIRPYGbH4M7lyJHxE19dn5ns4Sl5GPcA7zMkajqs7f6vJ
        CYQ7RUNrWFnYMECXR0yat5w=
X-Google-Smtp-Source: APiQypIkxumrWz+ndrMvOJ91zYJzQlX5sVnzAQWpOSbcaM+o3LFMTKXuBlxS10rMdu61zM/gqoUfMQ==
X-Received: by 2002:a1c:a5c8:: with SMTP id o191mr5451325wme.77.1587663660323;
        Thu, 23 Apr 2020 10:41:00 -0700 (PDT)
Received: from jernej-laptop.localnet (cpe-194-152-20-232.static.triera.net. [194.152.20.232])
        by smtp.gmail.com with ESMTPSA id i25sm4471771wml.43.2020.04.23.10.40.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Apr 2020 10:40:58 -0700 (PDT)
From:   Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To:     Maxime Ripard <mripard@kernel.org>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        Chen-Yu Tsai <wens@csie.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-sunxi@googlegroups.com
Cc:     linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, linux-sunxi@googlegroups.com,
        Samuel Holland <samuel@sholland.org>, samuel@sholland.org
Subject: Re: [linux-sunxi] [PATCH v2 1/2] media: cedrus: Program output format during each run
Date:   Thu, 23 Apr 2020 19:40:57 +0200
Message-ID: <2018061.irdbgypaU6@jernej-laptop>
In-Reply-To: <20200422040410.6251-1-samuel@sholland.org>
References: <20200422040410.6251-1-samuel@sholland.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Dne sreda, 22. april 2020 ob 06:04:09 CEST je Samuel Holland napisal(a):
> Previously, the output format was programmed as part of the ioctl()
> handler. However, this has two problems:
>=20
>   1) If there are multiple active streams with different output
>      formats, the hardware will use whichever format was set last
>      for both streams. Similary, an ioctl() done in an inactive
>      context will wrongly affect other active contexts.
>   2) The registers are written while the device is not actively
>      streaming. To enable runtime PM tied to the streaming state,
>      all hardware access needs to be moved inside cedrus_device_run().
>=20
> The call to cedrus_dst_format_set() is now placed just before the
> codec-specific callback that programs the hardware.
>=20
> Fixes: 50e761516f2b ("media: platform: Add Cedrus VPU decoder driver")
> Suggested-by: Jernej =C5=A0krabec <jernej.skrabec@gmail.com>
> Suggested-by: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
> Signed-off-by: Samuel Holland <samuel@sholland.org>

=46or what is worth:
Tested-by: Jernej Skrabec <jernej.skrabec@siol.net>
Reviewed-by: Jernej Skrabec <jernej.skrabec@siol.net>

Best regards,
Jernej



