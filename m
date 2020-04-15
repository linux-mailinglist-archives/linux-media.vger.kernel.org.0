Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C48E71AB1DD
	for <lists+linux-media@lfdr.de>; Wed, 15 Apr 2020 21:34:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2634414AbgDOTeL (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 15 Apr 2020 15:34:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58018 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S2406837AbgDOTdq (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 15 Apr 2020 15:33:46 -0400
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com [IPv6:2607:f8b0:4864:20::1043])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E41A3C061A0C
        for <linux-media@vger.kernel.org>; Wed, 15 Apr 2020 12:33:45 -0700 (PDT)
Received: by mail-pj1-x1043.google.com with SMTP id nu11so300864pjb.1
        for <linux-media@vger.kernel.org>; Wed, 15 Apr 2020 12:33:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:content-transfer-encoding:in-reply-to:references
         :subject:from:to:date:message-id:user-agent;
        bh=DhwjFm7NO3lz1+xSJxAVKegOT+4cvg/+tKLXup9pu8M=;
        b=JKgYDj3WnLm+i4KmF9cDrLbRzosg5ADIuIHwrxYrWTY6uyO3OXbBu62c3g6lMSDH/U
         rqb3PfYkTY/ItPGP391y30npnhYiKm5O73DiJ7aqpbMIVUT9xdzvK/cFzvf3p2BKQiVk
         jBtrWWfOOI3WXd9BWspvi3RgIm2SaOqHw7Gz8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:content-transfer-encoding
         :in-reply-to:references:subject:from:to:date:message-id:user-agent;
        bh=DhwjFm7NO3lz1+xSJxAVKegOT+4cvg/+tKLXup9pu8M=;
        b=drrV0wBX/VhKrO8Y6FcPkF48wRzvxnqF8i0IEnkHTvS7g2U3UScn/+qMG9O+hClml9
         Euohi5+lM0UjOxsx5DeibLj0+0oafw2mODYGSzTJyuVzWWrRNzzPNQVm2cE/yfWDN7da
         Yv977Wc7DEN4UI1vri9yWArbyyiH5zaFwINaKCZNy1aX4tSGQivTk4RiV/QGLtPzU89C
         KqhL3s1GTR2BmqzOwTT0i1+MJc1u/OI46GZH/yTdjVYMqizqTD7TOGU9Zxf9+LELJCnw
         IKi1skS9xy/E2FFtrnp8hpFhh/YawGeNZ1cu2Btwm1UAvZHNIPAIkufFriBxvaS/6XiV
         REhw==
X-Gm-Message-State: AGi0PuavgXOCxJ1GPJqrO8jKKzFTrouFYuR2NFsscg/b60JNwMrUdOKG
        khxEK57q82LZZemWqcC5cx5g1g==
X-Google-Smtp-Source: APiQypLF9I1HGpqBY5XoRsgbjZngLXUL4G8bMPpAW97Xf9cwgyxResxh8RcnSlTgxVSFyiABXXuyKg==
X-Received: by 2002:a17:902:8d89:: with SMTP id v9mr6512515plo.83.1586979225103;
        Wed, 15 Apr 2020 12:33:45 -0700 (PDT)
Received: from chromium.org ([2620:15c:202:1:fa53:7765:582b:82b9])
        by smtp.gmail.com with ESMTPSA id t12sm9098856pgm.37.2020.04.15.12.33.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Apr 2020 12:33:44 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1cdc4409-2113-cfe5-7eb2-6b1a6671e262@infradead.org>
References: <1cdc4409-2113-cfe5-7eb2-6b1a6671e262@infradead.org>
Subject: Re: uvcvideo: shift exponent -7 is negative
From:   Stephen Boyd <swboyd@chromium.org>
To:     LKML <linux-kernel@vger.kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Randy Dunlap <rdunlap@infradead.org>,
        linux-media <linux-media@vger.kernel.org>,
        linux-uvc-devel@lists.sourceforge.net,
        Fritz Koenig <frkoenig@google.com>
Date:   Wed, 15 Apr 2020 12:33:43 -0700
Message-ID: <158697922381.105027.9312351935387255622@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Quoting Randy Dunlap (2020-03-29 15:43:28)
> This is kernel version 5.6-rc6.
>=20
> UBSAN detected a bad shift value:
>=20
> [  511.693411] UBSAN: Undefined behaviour in ../drivers/media/usb/uvc/uvc=
_ctrl.c:781:13
> [  511.694043] shift exponent -7 is negative

I saw a similar problem. This patch fixed it for me but I'm not sure if
it's correct. The negative shift is done on the mask but we're going to
break out of the loop in that case so it isn't going to be used. Maybe
the loop should be a do while instead and then the mask can be
calculated at the start?

---8<----
diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/uvc_c=
trl.c
index e399b9fad757..ea6eb68329f3 100644
--- a/drivers/media/usb/uvc/uvc_ctrl.c
+++ b/drivers/media/usb/uvc/uvc_ctrl.c
@@ -778,7 +778,8 @@ static s32 uvc_get_le_value(struct uvc_control_mapping =
*mapping,
 		value |=3D offset > 0 ? (byte >> offset) : (byte << (-offset));
 		bits -=3D 8 - (offset > 0 ? offset : 0);
 		offset -=3D 8;
-		mask =3D (1 << bits) - 1;
+		if (bits > 0)
+			mask =3D (1 << bits) - 1;
 	}
=20
 	/* Sign-extend the value if needed. */
