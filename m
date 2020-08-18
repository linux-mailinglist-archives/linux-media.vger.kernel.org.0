Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6B266248D97
	for <lists+linux-media@lfdr.de>; Tue, 18 Aug 2020 19:58:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726675AbgHRR6i (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 18 Aug 2020 13:58:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57130 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726552AbgHRR6h (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 18 Aug 2020 13:58:37 -0400
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0AEDBC061389
        for <linux-media@vger.kernel.org>; Tue, 18 Aug 2020 10:58:37 -0700 (PDT)
Received: by mail-lf1-x130.google.com with SMTP id v15so10668443lfg.6
        for <linux-media@vger.kernel.org>; Tue, 18 Aug 2020 10:58:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=z9lrvTo7rq5kgvHiKv2CeK1NwQDAETYZmb1A4KPoksY=;
        b=ITFYfHbEN+hFb13NdWRIhLOmOJpo2cxqpx9m8ksUj21CwW6h7fLgIRtBanSOJMePyi
         5RVMjDTMnw/S3mseixXm/vz1GcNrZzN0K7rkxxik1UDONECrsNXp97SYaR7YVi/nAzP3
         G61EdNbTGahj5AP/xAfeXex00XM6kYeFjFum8DtNmkVGTxSvPst9nJX61pQgrfwFU7La
         v31XPwedmfkeGG5wLzSi+2CNJLnJ8QAimurFr7xlnSXJFxq3063A8Eo84EBPxeC7gmE2
         FYPgLwCGWky2XrC4EAxZt9B+3Tp/ZJK3n6DnNUDKW+lZD9mZ9kWKyZDpm51XOH91tRFZ
         +K+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=z9lrvTo7rq5kgvHiKv2CeK1NwQDAETYZmb1A4KPoksY=;
        b=nAXkghoFlP9dRLwDUU5A3hwDWwv2o576tYd7E0oyQEVVAccun7GRXKr5VsvJfzkGFO
         du+Dkeg6/L9kUnN4BvLEB5Wz9x/BYd4eUMKfw7x+vqbvOfYw/Zqn3vAk2SP0VNXRROIz
         dBEO3ycFymSvMNLYrjZy8jyceAwwYDh5zEAZPD7eDP+GRMJvwFGTKAwP49q5C8iBJ0SU
         7Yxqk/pjZ7stnwYeVGX/lF+gcYaDDEagZXtXYSF+8mCHYc7AwnWrUtpaOReftqi9obHc
         TxrO/LiwIGKDps7J4cZSSd5lxFbH8WhqlHD51O5lgnAXXr7tIxYFHfzrl9abqdUdExGU
         WqTg==
X-Gm-Message-State: AOAM532OeQn2egXuYYIXuaLX45wHr7Z8fJ0lONnX5PzMH1667ze7xQUb
        hzaZ3/p1hohD+fa68XQzy37MbMRRqdzp4GPfBUI=
X-Google-Smtp-Source: ABdhPJxBtd8Z7VZ3coG7iS6UWB4CfTRQra4+DlGNWfLiZJtFUI0IZICVc+dPXOEJLdLnNj2VORuTnK4ILo03ey3Pe0Y=
X-Received: by 2002:ac2:5683:: with SMTP id 3mr10117138lfr.69.1597773513830;
 Tue, 18 Aug 2020 10:58:33 -0700 (PDT)
MIME-Version: 1.0
References: <132c541a-58b7-4f5c-47f3-855ac5818377@acm.org>
In-Reply-To: <132c541a-58b7-4f5c-47f3-855ac5818377@acm.org>
From:   Fabio Estevam <festevam@gmail.com>
Date:   Tue, 18 Aug 2020 14:58:22 -0300
Message-ID: <CAOMZO5BhURkMW9Syw88OzuXGroqWAa+0fhttQqTT6GdRknX+Xg@mail.gmail.com>
Subject: Re: UBSAN: shift-out-of-bounds in drivers/media/usb/uvc/uvc_ctrl.c:781
To:     Bart Van Assche <bvanassche@acm.org>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-media <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Bart/Laurent,

On Tue, Aug 18, 2020 at 2:41 PM Bart Van Assche <bvanassche@acm.org> wrote:
>
> Hi,
>
> This morning I installed a debug build of kernel v5.8.1 on my laptop.
> The complaint shown below appeared in the kernel log. Is this a known
> issue?
>
> Thanks,
>
> Bart.
>
> ================================================================================
> UBSAN: shift-out-of-bounds in drivers/media/usb/uvc/uvc_ctrl.c:781:13
> shift exponent -7 is negative

Should we fix it like this?

--- a/drivers/media/usb/uvc/uvc_ctrl.c
+++ b/drivers/media/usb/uvc/uvc_ctrl.c
@@ -778,7 +778,7 @@ static s32 uvc_get_le_value(struct
uvc_control_mapping *mapping,
                value |= offset > 0 ? (byte >> offset) : (byte << (-offset));
                bits -= 8 - (offset > 0 ? offset : 0);
                offset -= 8;
-               mask = (1 << bits) - 1;
+               mask = (1LL << bits) - 1;
        }
