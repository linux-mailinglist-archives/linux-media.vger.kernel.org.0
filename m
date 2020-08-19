Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E9E2C2491BB
	for <lists+linux-media@lfdr.de>; Wed, 19 Aug 2020 02:18:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726918AbgHSAR7 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 18 Aug 2020 20:17:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59352 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726410AbgHSAR6 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 18 Aug 2020 20:17:58 -0400
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com [IPv6:2a00:1450:4864:20::241])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 246E0C061389
        for <linux-media@vger.kernel.org>; Tue, 18 Aug 2020 17:17:58 -0700 (PDT)
Received: by mail-lj1-x241.google.com with SMTP id i10so23429758ljn.2
        for <linux-media@vger.kernel.org>; Tue, 18 Aug 2020 17:17:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=dveeFvbnFcJF4gyfKG5kQqlDGlBlLud6TixtwAdGElc=;
        b=gSrCeL/+yxUeAf27uLoQ0aOzttw7EJwjj9pUpMwXcJAwDxlYSpPOVsYzknLxtcHR23
         5YF0PMCcOtOj2m8yJKr7qK5p6euvc/H80gOpZLYuiAAd+gmtS+F9h0yd12SzmH5eIwoY
         ycB2LZi7Pt11zI4ANaHlp/i31evvFNqn0r69KRCMU8ik8oYErCVjgP8bspV0OmZfNQ4o
         UlFv3mrGxjimRf352EH5pXDLv6H+cKGkt4VruYia/1Yo8//859qo2f41DCLknwS9Pf37
         zHIw+0lJ/KtFppZdYU3kK5reD7s5Mlo8SOZA0LDJsCZ9w4LKzhDSh8mQgjsZZNVbhY8d
         YGhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=dveeFvbnFcJF4gyfKG5kQqlDGlBlLud6TixtwAdGElc=;
        b=W+b8HEfJx8702ybbr/VxRkdVkwLXNqGbMdR0xRp33hctlE6UO1/cuy0VrdMxikAj4U
         /kDpDCsfemsu2WBASUX0FdU/qdD3h24sz7eQucnvK/vt3phsex/c905mNuo1sm4hzCW9
         diLAUYF84ff+21O41pqCEHFlwRcPDjd1rZks738nVazwgMAySmJDCVsNyIILsCpR2fAd
         EddiI47cUj8uNUg+mvVEFSTZOn0LjKqz/uUQcRoSKgO8iCFUso2VlZoVy+HBh1fWWiXK
         jozBX3IevSAD0LxFplo1ylR25GzLRzWGaUjEGQC8YM7k/nHNlsp9RR92+C/pHUujQujp
         AdFg==
X-Gm-Message-State: AOAM5322N4Cz8iyLErgtIB1QX8NF9kyYvguidP2Mx0rnL4Y1BYMdZtLe
        CFs8d/SQt8EKS/8cm2HsN+tHB8e5QB69avHF+A4AEXzNFMM=
X-Google-Smtp-Source: ABdhPJyfIBYc2/c9C7QHVeRXXmY93YY+px9SGa9re5xVBbE4xn4d4PvVg4LMN4rP/aOTxfCixXdc5PD8CeaS1ag3/50=
X-Received: by 2002:a2e:80d3:: with SMTP id r19mr11489301ljg.310.1597796276455;
 Tue, 18 Aug 2020 17:17:56 -0700 (PDT)
MIME-Version: 1.0
References: <132c541a-58b7-4f5c-47f3-855ac5818377@acm.org> <CAOMZO5BhURkMW9Syw88OzuXGroqWAa+0fhttQqTT6GdRknX+Xg@mail.gmail.com>
 <20200818235406.GE2360@pendragon.ideasonboard.com>
In-Reply-To: <20200818235406.GE2360@pendragon.ideasonboard.com>
From:   Fabio Estevam <festevam@gmail.com>
Date:   Tue, 18 Aug 2020 21:17:44 -0300
Message-ID: <CAOMZO5DEbcRWOXPALQUQP_PPybBu-iGa+wS+w0CU4XXaO4xZWQ@mail.gmail.com>
Subject: Re: UBSAN: shift-out-of-bounds in drivers/media/usb/uvc/uvc_ctrl.c:781
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Bart Van Assche <bvanassche@acm.org>,
        linux-media <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Laurent,

On Tue, Aug 18, 2020 at 8:54 PM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:

> No, the issue is that bits is equal to -7, 1LL won't change that.
>
> Once bits become negative, the loop stops, and the mask value isn't used
> afterwards. This would only cause an issue if a shift with a negative
> value generated side effects (such as a trap for instance) on top of
> producing an incorrect result. Can this happen ? I suppose we should
> silence the warning even if it's a false positive, as it doesn't look
> good in the kernel log.

Yes, you are right.

One way to avoid the negative shift:

--- a/drivers/media/usb/uvc/uvc_ctrl.c
+++ b/drivers/media/usb/uvc/uvc_ctrl.c
@@ -778,7 +778,8 @@ static s32 uvc_get_le_value(struct
uvc_control_mapping *mapping,
                value |= offset > 0 ? (byte >> offset) : (byte << (-offset));
                bits -= 8 - (offset > 0 ? offset : 0);
                offset -= 8;
-               mask = (1 << bits) - 1;
+               if (bits > 0)
+                       mask = (1 << bits) - 1;
        }

        /* Sign-extend the value if needed. */

Just saw your patch where you quit the while(1) if bits <=0. Thanks!
